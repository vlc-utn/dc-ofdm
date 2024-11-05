library work;
library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use STD.textio.all;
	use IEEE.std_logic_textio.all;
	use IEEE.NUMERIC_STD.ALL;

entity pulse_tb is
--  Port ( );
end pulse_tb;

architecture Behavioral of pulse_tb is
    -- Choose which file to use for the test
    constant PATH_OUTPUT_FILE: string := "data_out.mem";
    constant PATH_INPUT_FILE: string := "data_in_with_zeros_intercalado.mem";
    constant MAX_ITERATIONS: integer := 3;
    
	constant PERIOD : time := 8ns;    -- 125MHz ADC clock
	
	-----------------------
	-- Component signals
	-----------------------
	-- Output FIFO interface
    signal m_axis_tdata_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
    signal m_axis_tvalid_0 : STD_LOGIC;
    signal m_axis_tready_0 : STD_LOGIC := '0';
    
    -- Input of the rx
    signal data_in_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal header_ack_0 : STD_LOGIC := '0';
    
    -- Interface with the RX
    signal end_out_0 : STD_LOGIC;
    signal header_ready_0 : STD_LOGIC;
    
    -- Clocks
    signal clk_adc : STD_LOGIC := '0';  -- 125 MHz
    signal clk_rx : STD_LOGIC;          -- 125 MHz
    signal clk_fifo_s : STD_LOGIC;      -- 15.625 MHz
    
    -- Reset signal (ACTIVE LOW)
    signal reset_rtl : STD_LOGIC := '1'; 
begin

dut_instance: entity work.full_rx_wrapper
PORT MAP (
      clk_adc => clk_adc,
      clk_fifo_s => clk_fifo_s,
      clk_rx => clk_rx,
      data_in_0(15 downto 0) => data_in_0(15 downto 0),
      m_axis_tdata_0(7 downto 0) => m_axis_tdata_0(7 downto 0),
      m_axis_tready_0 => m_axis_tready_0,
      m_axis_tvalid_0 => m_axis_tvalid_0,
      reset_rtl => reset_rtl,
      end_out_0 => end_out_0,
      header_ack_0 => header_ack_0,
      header_ready_0 => header_ready_0
    );

clock: process begin
    clk_adc <= not clk_adc; wait for PERIOD/2;
end process;

fileInput : process
 -- Variables used to read the flile
	file file_handler:     text;
	variable file_status:  file_open_status;
	variable buffer_line:  line;               -- Holds a line from the file
	variable spacer:       character;          -- Placeholder to discard the spacer between values
	variable file_rows:    integer := 1;       -- Current row of the file. Starts at 1 because line zero is used as metadata
	
    -- These variables should be identical to the component signals, but with the "file_xx" prefix.
	variable file_data_in:         std_logic_vector (15 downto 0);

begin
    -----------------------------------
    -- Read values from input file, and write them directly to the RX
    -----------------------------------
    file_open (file_status, file_handler, PATH_INPUT_FILE);
    assert (file_status = OPEN_OK) report ">>> Could not open input file" severity failure;
    readLine (file_handler, buffer_line); -- Discard header
    wait until rising_edge(clk_rx);
    
    file_input_loop: while (not endfile(file_handler) ) loop
    
        readLine(file_handler, buffer_line);
        
        -- Read values from input file
        read(buffer_line, file_data_in);
        data_in_0 <= file_data_in;
        
        wait until rising_edge(clk_rx);
        file_rows := file_rows + 1;
            
    end loop file_input_loop;
    file_close (file_handler);

end process;

fileOutput : process
    -- Variables used to read the flile
	file file_handler:     text;
	variable file_status:  file_open_status;
	variable buffer_line:  line;               -- Holds a line from the file
	variable spacer:       character;          -- Placeholder to discard the spacer between values
	variable file_rows:    integer := 1;       -- Current row of the file. Starts at 1 because line zero is used as metadata
	variable iterations:   integer := 0;       -- Current iteration of the message received.
	
    -- These variables should be identical to the component signals, but with the "file_xx" prefix.
	variable file_data_out:        std_logic_vector (7 downto 0);
    
begin
    if (iterations = 0) then
        -- Reset IP Cores
        reset_rtl <= '0'; wait for 200ns;
        reset_rtl <= '1'; wait for 1000ns;
    end if;
    
    assert(header_ready_0 = '0') report ">>> Header ready should be 0" severity failure;
    
    ----------------------------------
    -- Wait for the reception to end
    -----------------------------------
    wait until rising_edge(end_out_0);
    
    assert(header_ready_0 = '1') report ">>> Header ready should be 1" severity failure;
    
    header_ack_0 <= '1';
    wait for 1000ns;
    header_ack_0 <= '0';
    assert(header_ready_0 = '0') report ">>> Header ready should be 0" severity failure;
    
    ---------------------------------
    -- Read values from output FIFO
    ---------------------------------
    file_rows := 1;
	file_open (file_status, file_handler, PATH_OUTPUT_FILE, READ_MODE);
	assert (file_status = OPEN_OK) report ">>> Could not open output file" severity failure;
	readLine (file_handler, buffer_line);  -- Discard header

    m_axis_tready_0 <= '1';
    wait until rising_edge(clk_rx);
	file_reading_loop: while (not endfile(file_handler) ) loop
        
    	readLine (file_handler, buffer_line);
    	read (buffer_line, file_data_out);
    	
    	-- Compare outputs
       assert (file_data_out = m_axis_tdata_0) 
       report ">>> Output mismatch on line: " & INTEGER'image(file_rows)
       severity failure;

        wait until rising_edge(clk_rx);
    	file_rows := file_rows + 1;
   	 
	end loop file_reading_loop;
	file_close (file_handler);
	m_axis_tready_0 <= '0';
	
	iterations := iterations + 1;
    
    if (iterations = MAX_ITERATIONS) then
        report ">>> Test Successful!" severity note;
        wait;
    end if;
    
end process;

end Behavioral;
