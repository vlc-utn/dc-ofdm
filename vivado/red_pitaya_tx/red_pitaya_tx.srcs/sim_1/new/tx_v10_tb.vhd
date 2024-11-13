library work;
library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use STD.textio.all;
	use IEEE.std_logic_textio.all;
	use IEEE.NUMERIC_STD.ALL;

entity tx_v10_tb is
--  Port ( );
end tx_v10_tb;

architecture Behavioral of tx_v10_tb is
    -- Choose which file to use for the test
    constant PATH_OUTPUT_FILE: string := "data_out.mem";
    constant PATH_INPUT_FILE: string := "data_in.mem";
    constant MAX_ITERATIONS: integer := 3; -- Amount of times that the message will be sent.
    
	constant PERIOD : time := 8ns;    -- 125MHz DAC clock
	
	-----------------------
	-- Component signals
	-----------------------
	-- Output of the tx
    signal data_out_0 : STD_LOGIC_VECTOR ( 15 downto 0 );
    signal valid_out_0 : STD_LOGIC;
    signal new_msg_ready_0 : STD_LOGIC;
    
    -- Input of the tx
    signal new_frame_in_0 : STD_LOGIC := '0';
    
    -- Fifo
    signal s_axis_tdata_0 : STD_LOGIC_VECTOR ( 7 downto 0 );
    signal s_axis_tvalid_0 : STD_LOGIC := '0';
    signal s_axis_tready_0 : STD_LOGIC;
    
    -- Clocks
    signal clk_dac : STD_LOGIC := '0';  -- 125 MHz
    signal clk_tx : STD_LOGIC;          -- 125 MHz
    signal clk_fifo_m : STD_LOGIC;      -- 15.625 MHz
    
    -- Reset signal (ACTIVE LOW)
    signal rst : STD_LOGIC := '1'; 
begin

dut_instance: entity work.tx_v10_wrapper
PORT MAP (
      data_out_0(15 downto 0) => data_out_0(15 downto 0),
      clk_dac => clk_dac,
      clk_fifo_m => clk_fifo_m,
      clk_tx => clk_tx,
      new_frame_in_0 => new_frame_in_0,
      new_msg_ready_0 => new_msg_ready_0,
      rst => rst,
      s_axis_tdata_0(7 downto 0) => s_axis_tdata_0(7 downto 0),
      s_axis_tready_0 => s_axis_tready_0,
      s_axis_tvalid_0 => s_axis_tvalid_0,
      valid_out_0 => valid_out_0
    );

clock: process begin
    clk_dac <= not clk_dac; wait for PERIOD/2;
end process;

fileIO : process
    -- Variables used to read the flile
	file file_handler:     text;
	variable file_status:  file_open_status;
	variable buffer_line:  line;               -- Holds a line from the file
	variable spacer:       character;          -- Placeholder to discard the spacer between values
	variable file_rows:    integer := 1;       -- Current row of the file. Starts at 1 because line zero is used as metadata
	variable iterations:   integer := 0;       -- Tracks the amount of times that the message is sent.
	
    -- These variables should be identical to the component signals, but with the "file_xx" prefix.
	variable file_data_in:         std_logic_vector (7 downto 0);
	variable file_data_out:        std_logic_vector (15 downto 0);
    
begin

    if (iterations = 0) then
        -- Reset IP Cores
        rst <= '0'; wait for 200ns;
        rst <= '1'; wait for 1000ns;
    end if;
    
    ----------------------------------
    -- Read input file and load FIFO
    ----------------------------------
    file_open (file_status, file_handler, PATH_INPUT_FILE);
    assert (file_status = OPEN_OK) report ">>> Could not open input file" severity failure;
    readLine (file_handler, buffer_line); -- Discard header
    wait until rising_edge(clk_tx);
    
    file_input_loop: while (not endfile(file_handler) ) loop
    
        -- Wait for AXI4-Stream TVALID before writing any values.
        if (s_axis_tready_0 = '0') then
            wait until rising_edge(s_axis_tready_0);
        end if;
    
        readLine(file_handler, buffer_line);
        
        -- Read values from input file
        read(buffer_line, file_data_in);
        s_axis_tdata_0 <= file_data_in;
        
        -- TVALID is always held "up"
        s_axis_tvalid_0 <= '1';
        
        wait until rising_edge(clk_tx);
        file_rows := file_rows + 1;
            
    end loop file_input_loop;
    
    -- Lower tvalid
    s_axis_tvalid_0 <= '0';
    file_close (file_handler);
    
    ---------------------------------
    -- Setting initialization values
    ---------------------------------
    wait until rising_edge(clk_fifo_m);
    
    assert(new_msg_ready_0 = '1') report ">>> Msg ready should be 1" severity failure;
    
    new_frame_in_0 <= '1';
    
    wait until rising_edge(clk_fifo_m);
    new_frame_in_0 <= '0';
    
    wait for 1000ns;
    assert(new_msg_ready_0 = '0') report ">>> Msg ready should be 0" severity failure;

    ---------------------------------
    -- Read values from output file
    ---------------------------------
    file_rows := 1;
	file_open (file_status, file_handler, PATH_OUTPUT_FILE, READ_MODE);
	assert (file_status = OPEN_OK) report ">>> Could not open output file" severity failure;
	readLine (file_handler, buffer_line);  -- Discard header

	file_reading_loop: while (not endfile(file_handler) ) loop
	   
        if (valid_out_0 = '0') then
            wait until rising_edge(valid_out_0);
            wait until rising_edge(clk_tx);
        end if;
        
    	readLine (file_handler, buffer_line);
    	read (buffer_line, file_data_out);
    	
    	-- Compare outputs
       assert (file_data_out = data_out_0) 
       report ">>> Output mismatch on line: " & INTEGER'image(file_rows)
       severity failure;

        wait until rising_edge(clk_tx);
    	file_rows := file_rows + 1;
   	 
	end loop file_reading_loop;
	file_close (file_handler);
	
	wait for 100ns;
	assert(new_msg_ready_0 = '1') report ">>> Msg ready should be 1" severity failure;

    iterations := iterations + 1;
	
	if (iterations = MAX_ITERATIONS) then
        report ">>> Test Successful!" severity note;
        wait;
	end if;
end process;

end Behavioral;
