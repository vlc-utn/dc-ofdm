-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_SinLookUpTableGen.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_SinLookUpTableGen
-- Source Path: HDLRxDemodulator/rx_demodulator_full/downshifter/NCO/WaveformGen/SinLookUpTableGen
-- Hierarchy Level: 4
-- Model version: 1.70
-- 
-- Sin Look Up Table Generation Component
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_optimized_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_optimized_src_SinLookUpTableGen IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        lutaddr                           :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
        lutSine                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END rx_demod_optimized_src_SinLookUpTableGen;


ARCHITECTURE rtl OF rx_demod_optimized_src_SinLookUpTableGen IS

  -- Constants
  CONSTANT DirectLookupTable_data         : vector_of_signed16(0 TO 511) := 
    (to_signed(16#0000#, 16), to_signed(16#0019#, 16), to_signed(16#0032#, 16), to_signed(16#004B#, 16),
     to_signed(16#0065#, 16), to_signed(16#007E#, 16), to_signed(16#0097#, 16), to_signed(16#00B0#, 16),
     to_signed(16#00C9#, 16), to_signed(16#00E2#, 16), to_signed(16#00FB#, 16), to_signed(16#0114#, 16),
     to_signed(16#012E#, 16), to_signed(16#0147#, 16), to_signed(16#0160#, 16), to_signed(16#0179#, 16),
     to_signed(16#0192#, 16), to_signed(16#01AB#, 16), to_signed(16#01C4#, 16), to_signed(16#01DD#, 16),
     to_signed(16#01F7#, 16), to_signed(16#0210#, 16), to_signed(16#0229#, 16), to_signed(16#0242#, 16),
     to_signed(16#025B#, 16), to_signed(16#0274#, 16), to_signed(16#028D#, 16), to_signed(16#02A6#, 16),
     to_signed(16#02C0#, 16), to_signed(16#02D9#, 16), to_signed(16#02F2#, 16), to_signed(16#030B#, 16),
     to_signed(16#0324#, 16), to_signed(16#033D#, 16), to_signed(16#0356#, 16), to_signed(16#036F#, 16),
     to_signed(16#0388#, 16), to_signed(16#03A1#, 16), to_signed(16#03BB#, 16), to_signed(16#03D4#, 16),
     to_signed(16#03ED#, 16), to_signed(16#0406#, 16), to_signed(16#041F#, 16), to_signed(16#0438#, 16),
     to_signed(16#0451#, 16), to_signed(16#046A#, 16), to_signed(16#0483#, 16), to_signed(16#049C#, 16),
     to_signed(16#04B5#, 16), to_signed(16#04CE#, 16), to_signed(16#04E7#, 16), to_signed(16#0500#, 16),
     to_signed(16#051A#, 16), to_signed(16#0533#, 16), to_signed(16#054C#, 16), to_signed(16#0565#, 16),
     to_signed(16#057E#, 16), to_signed(16#0597#, 16), to_signed(16#05B0#, 16), to_signed(16#05C9#, 16),
     to_signed(16#05E2#, 16), to_signed(16#05FB#, 16), to_signed(16#0614#, 16), to_signed(16#062D#, 16),
     to_signed(16#0646#, 16), to_signed(16#065F#, 16), to_signed(16#0678#, 16), to_signed(16#0691#, 16),
     to_signed(16#06AA#, 16), to_signed(16#06C3#, 16), to_signed(16#06DC#, 16), to_signed(16#06F5#, 16),
     to_signed(16#070E#, 16), to_signed(16#0727#, 16), to_signed(16#0740#, 16), to_signed(16#0759#, 16),
     to_signed(16#0772#, 16), to_signed(16#078B#, 16), to_signed(16#07A4#, 16), to_signed(16#07BD#, 16),
     to_signed(16#07D6#, 16), to_signed(16#07EF#, 16), to_signed(16#0807#, 16), to_signed(16#0820#, 16),
     to_signed(16#0839#, 16), to_signed(16#0852#, 16), to_signed(16#086B#, 16), to_signed(16#0884#, 16),
     to_signed(16#089D#, 16), to_signed(16#08B6#, 16), to_signed(16#08CF#, 16), to_signed(16#08E8#, 16),
     to_signed(16#0901#, 16), to_signed(16#0919#, 16), to_signed(16#0932#, 16), to_signed(16#094B#, 16),
     to_signed(16#0964#, 16), to_signed(16#097D#, 16), to_signed(16#0996#, 16), to_signed(16#09AF#, 16),
     to_signed(16#09C7#, 16), to_signed(16#09E0#, 16), to_signed(16#09F9#, 16), to_signed(16#0A12#, 16),
     to_signed(16#0A2B#, 16), to_signed(16#0A44#, 16), to_signed(16#0A5C#, 16), to_signed(16#0A75#, 16),
     to_signed(16#0A8E#, 16), to_signed(16#0AA7#, 16), to_signed(16#0AC0#, 16), to_signed(16#0AD8#, 16),
     to_signed(16#0AF1#, 16), to_signed(16#0B0A#, 16), to_signed(16#0B23#, 16), to_signed(16#0B3B#, 16),
     to_signed(16#0B54#, 16), to_signed(16#0B6D#, 16), to_signed(16#0B85#, 16), to_signed(16#0B9E#, 16),
     to_signed(16#0BB7#, 16), to_signed(16#0BD0#, 16), to_signed(16#0BE8#, 16), to_signed(16#0C01#, 16),
     to_signed(16#0C1A#, 16), to_signed(16#0C32#, 16), to_signed(16#0C4B#, 16), to_signed(16#0C64#, 16),
     to_signed(16#0C7C#, 16), to_signed(16#0C95#, 16), to_signed(16#0CAE#, 16), to_signed(16#0CC6#, 16),
     to_signed(16#0CDF#, 16), to_signed(16#0CF8#, 16), to_signed(16#0D10#, 16), to_signed(16#0D29#, 16),
     to_signed(16#0D41#, 16), to_signed(16#0D5A#, 16), to_signed(16#0D72#, 16), to_signed(16#0D8B#, 16),
     to_signed(16#0DA4#, 16), to_signed(16#0DBC#, 16), to_signed(16#0DD5#, 16), to_signed(16#0DED#, 16),
     to_signed(16#0E06#, 16), to_signed(16#0E1E#, 16), to_signed(16#0E37#, 16), to_signed(16#0E4F#, 16),
     to_signed(16#0E68#, 16), to_signed(16#0E80#, 16), to_signed(16#0E99#, 16), to_signed(16#0EB1#, 16),
     to_signed(16#0ECA#, 16), to_signed(16#0EE2#, 16), to_signed(16#0EFB#, 16), to_signed(16#0F13#, 16),
     to_signed(16#0F2B#, 16), to_signed(16#0F44#, 16), to_signed(16#0F5C#, 16), to_signed(16#0F75#, 16),
     to_signed(16#0F8D#, 16), to_signed(16#0FA5#, 16), to_signed(16#0FBE#, 16), to_signed(16#0FD6#, 16),
     to_signed(16#0FEE#, 16), to_signed(16#1007#, 16), to_signed(16#101F#, 16), to_signed(16#1037#, 16),
     to_signed(16#1050#, 16), to_signed(16#1068#, 16), to_signed(16#1080#, 16), to_signed(16#1099#, 16),
     to_signed(16#10B1#, 16), to_signed(16#10C9#, 16), to_signed(16#10E1#, 16), to_signed(16#10FA#, 16),
     to_signed(16#1112#, 16), to_signed(16#112A#, 16), to_signed(16#1142#, 16), to_signed(16#115A#, 16),
     to_signed(16#1173#, 16), to_signed(16#118B#, 16), to_signed(16#11A3#, 16), to_signed(16#11BB#, 16),
     to_signed(16#11D3#, 16), to_signed(16#11EB#, 16), to_signed(16#1204#, 16), to_signed(16#121C#, 16),
     to_signed(16#1234#, 16), to_signed(16#124C#, 16), to_signed(16#1264#, 16), to_signed(16#127C#, 16),
     to_signed(16#1294#, 16), to_signed(16#12AC#, 16), to_signed(16#12C4#, 16), to_signed(16#12DC#, 16),
     to_signed(16#12F4#, 16), to_signed(16#130C#, 16), to_signed(16#1324#, 16), to_signed(16#133C#, 16),
     to_signed(16#1354#, 16), to_signed(16#136C#, 16), to_signed(16#1384#, 16), to_signed(16#139C#, 16),
     to_signed(16#13B4#, 16), to_signed(16#13CC#, 16), to_signed(16#13E4#, 16), to_signed(16#13FB#, 16),
     to_signed(16#1413#, 16), to_signed(16#142B#, 16), to_signed(16#1443#, 16), to_signed(16#145B#, 16),
     to_signed(16#1473#, 16), to_signed(16#148B#, 16), to_signed(16#14A2#, 16), to_signed(16#14BA#, 16),
     to_signed(16#14D2#, 16), to_signed(16#14EA#, 16), to_signed(16#1501#, 16), to_signed(16#1519#, 16),
     to_signed(16#1531#, 16), to_signed(16#1549#, 16), to_signed(16#1560#, 16), to_signed(16#1578#, 16),
     to_signed(16#1590#, 16), to_signed(16#15A7#, 16), to_signed(16#15BF#, 16), to_signed(16#15D7#, 16),
     to_signed(16#15EE#, 16), to_signed(16#1606#, 16), to_signed(16#161D#, 16), to_signed(16#1635#, 16),
     to_signed(16#164C#, 16), to_signed(16#1664#, 16), to_signed(16#167C#, 16), to_signed(16#1693#, 16),
     to_signed(16#16AB#, 16), to_signed(16#16C2#, 16), to_signed(16#16DA#, 16), to_signed(16#16F1#, 16),
     to_signed(16#1709#, 16), to_signed(16#1720#, 16), to_signed(16#1737#, 16), to_signed(16#174F#, 16),
     to_signed(16#1766#, 16), to_signed(16#177E#, 16), to_signed(16#1795#, 16), to_signed(16#17AC#, 16),
     to_signed(16#17C4#, 16), to_signed(16#17DB#, 16), to_signed(16#17F2#, 16), to_signed(16#180A#, 16),
     to_signed(16#1821#, 16), to_signed(16#1838#, 16), to_signed(16#184F#, 16), to_signed(16#1867#, 16),
     to_signed(16#187E#, 16), to_signed(16#1895#, 16), to_signed(16#18AC#, 16), to_signed(16#18C3#, 16),
     to_signed(16#18DB#, 16), to_signed(16#18F2#, 16), to_signed(16#1909#, 16), to_signed(16#1920#, 16),
     to_signed(16#1937#, 16), to_signed(16#194E#, 16), to_signed(16#1965#, 16), to_signed(16#197C#, 16),
     to_signed(16#1993#, 16), to_signed(16#19AA#, 16), to_signed(16#19C1#, 16), to_signed(16#19D8#, 16),
     to_signed(16#19EF#, 16), to_signed(16#1A06#, 16), to_signed(16#1A1D#, 16), to_signed(16#1A34#, 16),
     to_signed(16#1A4B#, 16), to_signed(16#1A62#, 16), to_signed(16#1A79#, 16), to_signed(16#1A90#, 16),
     to_signed(16#1AA7#, 16), to_signed(16#1ABE#, 16), to_signed(16#1AD4#, 16), to_signed(16#1AEB#, 16),
     to_signed(16#1B02#, 16), to_signed(16#1B19#, 16), to_signed(16#1B30#, 16), to_signed(16#1B46#, 16),
     to_signed(16#1B5D#, 16), to_signed(16#1B74#, 16), to_signed(16#1B8A#, 16), to_signed(16#1BA1#, 16),
     to_signed(16#1BB8#, 16), to_signed(16#1BCE#, 16), to_signed(16#1BE5#, 16), to_signed(16#1BFC#, 16),
     to_signed(16#1C12#, 16), to_signed(16#1C29#, 16), to_signed(16#1C3F#, 16), to_signed(16#1C56#, 16),
     to_signed(16#1C6C#, 16), to_signed(16#1C83#, 16), to_signed(16#1C99#, 16), to_signed(16#1CB0#, 16),
     to_signed(16#1CC6#, 16), to_signed(16#1CDD#, 16), to_signed(16#1CF3#, 16), to_signed(16#1D0A#, 16),
     to_signed(16#1D20#, 16), to_signed(16#1D36#, 16), to_signed(16#1D4D#, 16), to_signed(16#1D63#, 16),
     to_signed(16#1D79#, 16), to_signed(16#1D90#, 16), to_signed(16#1DA6#, 16), to_signed(16#1DBC#, 16),
     to_signed(16#1DD3#, 16), to_signed(16#1DE9#, 16), to_signed(16#1DFF#, 16), to_signed(16#1E15#, 16),
     to_signed(16#1E2B#, 16), to_signed(16#1E42#, 16), to_signed(16#1E58#, 16), to_signed(16#1E6E#, 16),
     to_signed(16#1E84#, 16), to_signed(16#1E9A#, 16), to_signed(16#1EB0#, 16), to_signed(16#1EC6#, 16),
     to_signed(16#1EDC#, 16), to_signed(16#1EF2#, 16), to_signed(16#1F08#, 16), to_signed(16#1F1E#, 16),
     to_signed(16#1F34#, 16), to_signed(16#1F4A#, 16), to_signed(16#1F60#, 16), to_signed(16#1F76#, 16),
     to_signed(16#1F8C#, 16), to_signed(16#1FA2#, 16), to_signed(16#1FB7#, 16), to_signed(16#1FCD#, 16),
     to_signed(16#1FE3#, 16), to_signed(16#1FF9#, 16), to_signed(16#200F#, 16), to_signed(16#2024#, 16),
     to_signed(16#203A#, 16), to_signed(16#2050#, 16), to_signed(16#2065#, 16), to_signed(16#207B#, 16),
     to_signed(16#2091#, 16), to_signed(16#20A6#, 16), to_signed(16#20BC#, 16), to_signed(16#20D1#, 16),
     to_signed(16#20E7#, 16), to_signed(16#20FD#, 16), to_signed(16#2112#, 16), to_signed(16#2128#, 16),
     to_signed(16#213D#, 16), to_signed(16#2153#, 16), to_signed(16#2168#, 16), to_signed(16#217D#, 16),
     to_signed(16#2193#, 16), to_signed(16#21A8#, 16), to_signed(16#21BE#, 16), to_signed(16#21D3#, 16),
     to_signed(16#21E8#, 16), to_signed(16#21FE#, 16), to_signed(16#2213#, 16), to_signed(16#2228#, 16),
     to_signed(16#223D#, 16), to_signed(16#2253#, 16), to_signed(16#2268#, 16), to_signed(16#227D#, 16),
     to_signed(16#2292#, 16), to_signed(16#22A7#, 16), to_signed(16#22BC#, 16), to_signed(16#22D2#, 16),
     to_signed(16#22E7#, 16), to_signed(16#22FC#, 16), to_signed(16#2311#, 16), to_signed(16#2326#, 16),
     to_signed(16#233B#, 16), to_signed(16#2350#, 16), to_signed(16#2365#, 16), to_signed(16#237A#, 16),
     to_signed(16#238E#, 16), to_signed(16#23A3#, 16), to_signed(16#23B8#, 16), to_signed(16#23CD#, 16),
     to_signed(16#23E2#, 16), to_signed(16#23F7#, 16), to_signed(16#240B#, 16), to_signed(16#2420#, 16),
     to_signed(16#2435#, 16), to_signed(16#244A#, 16), to_signed(16#245E#, 16), to_signed(16#2473#, 16),
     to_signed(16#2488#, 16), to_signed(16#249C#, 16), to_signed(16#24B1#, 16), to_signed(16#24C5#, 16),
     to_signed(16#24DA#, 16), to_signed(16#24EF#, 16), to_signed(16#2503#, 16), to_signed(16#2518#, 16),
     to_signed(16#252C#, 16), to_signed(16#2541#, 16), to_signed(16#2555#, 16), to_signed(16#2569#, 16),
     to_signed(16#257E#, 16), to_signed(16#2592#, 16), to_signed(16#25A6#, 16), to_signed(16#25BB#, 16),
     to_signed(16#25CF#, 16), to_signed(16#25E3#, 16), to_signed(16#25F8#, 16), to_signed(16#260C#, 16),
     to_signed(16#2620#, 16), to_signed(16#2634#, 16), to_signed(16#2648#, 16), to_signed(16#265C#, 16),
     to_signed(16#2671#, 16), to_signed(16#2685#, 16), to_signed(16#2699#, 16), to_signed(16#26AD#, 16),
     to_signed(16#26C1#, 16), to_signed(16#26D5#, 16), to_signed(16#26E9#, 16), to_signed(16#26FD#, 16),
     to_signed(16#2711#, 16), to_signed(16#2724#, 16), to_signed(16#2738#, 16), to_signed(16#274C#, 16),
     to_signed(16#2760#, 16), to_signed(16#2774#, 16), to_signed(16#2788#, 16), to_signed(16#279B#, 16),
     to_signed(16#27AF#, 16), to_signed(16#27C3#, 16), to_signed(16#27D6#, 16), to_signed(16#27EA#, 16),
     to_signed(16#27FE#, 16), to_signed(16#2811#, 16), to_signed(16#2825#, 16), to_signed(16#2838#, 16),
     to_signed(16#284C#, 16), to_signed(16#2860#, 16), to_signed(16#2873#, 16), to_signed(16#2886#, 16),
     to_signed(16#289A#, 16), to_signed(16#28AD#, 16), to_signed(16#28C1#, 16), to_signed(16#28D4#, 16),
     to_signed(16#28E7#, 16), to_signed(16#28FB#, 16), to_signed(16#290E#, 16), to_signed(16#2921#, 16),
     to_signed(16#2935#, 16), to_signed(16#2948#, 16), to_signed(16#295B#, 16), to_signed(16#296E#, 16),
     to_signed(16#2981#, 16), to_signed(16#2994#, 16), to_signed(16#29A7#, 16), to_signed(16#29BB#, 16),
     to_signed(16#29CE#, 16), to_signed(16#29E1#, 16), to_signed(16#29F4#, 16), to_signed(16#2A07#, 16),
     to_signed(16#2A1A#, 16), to_signed(16#2A2C#, 16), to_signed(16#2A3F#, 16), to_signed(16#2A52#, 16),
     to_signed(16#2A65#, 16), to_signed(16#2A78#, 16), to_signed(16#2A8B#, 16), to_signed(16#2A9D#, 16),
     to_signed(16#2AB0#, 16), to_signed(16#2AC3#, 16), to_signed(16#2AD6#, 16), to_signed(16#2AE8#, 16),
     to_signed(16#2AFB#, 16), to_signed(16#2B0D#, 16), to_signed(16#2B20#, 16), to_signed(16#2B33#, 16),
     to_signed(16#2B45#, 16), to_signed(16#2B58#, 16), to_signed(16#2B6A#, 16), to_signed(16#2B7D#, 16),
     to_signed(16#2B8F#, 16), to_signed(16#2BA1#, 16), to_signed(16#2BB4#, 16), to_signed(16#2BC6#, 16),
     to_signed(16#2BD8#, 16), to_signed(16#2BEB#, 16), to_signed(16#2BFD#, 16), to_signed(16#2C0F#, 16),
     to_signed(16#2C21#, 16), to_signed(16#2C34#, 16), to_signed(16#2C46#, 16), to_signed(16#2C58#, 16),
     to_signed(16#2C6A#, 16), to_signed(16#2C7C#, 16), to_signed(16#2C8E#, 16), to_signed(16#2CA0#, 16),
     to_signed(16#2CB2#, 16), to_signed(16#2CC4#, 16), to_signed(16#2CD6#, 16), to_signed(16#2CE8#, 16),
     to_signed(16#2CFA#, 16), to_signed(16#2D0C#, 16), to_signed(16#2D1E#, 16), to_signed(16#2D2F#, 16));  -- sfix16 [512]

  -- Signals
  SIGNAL lutaddr_unsigned                 : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL lutaddrInReg                     : unsigned(8 DOWNTO 0) := to_unsigned(16#000#, 9);  -- ufix9
  SIGNAL lutSineout                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL lutSineoutreg1                   : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16_En14
  SIGNAL lutSine_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  lutaddr_unsigned <= unsigned(lutaddr);

  -- Look up table address input register
  LUTaddrRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        lutaddrInReg <= lutaddr_unsigned;
      END IF;
    END IF;
  END PROCESS LUTaddrRegister_process;


  -- Octant Sine wave table
  lutSineout <= DirectLookupTable_data(to_integer(lutaddrInReg));

  -- Sin lookup table output register
  LUTSineoutResetRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        lutSineoutreg1 <= lutSineout;
      END IF;
    END IF;
  END PROCESS LUTSineoutResetRegister_process;


  LUTSineoutRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        lutSine_tmp <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        lutSine_tmp <= lutSineoutreg1;
      END IF;
    END IF;
  END PROCESS LUTSineoutRegister_process;


  lutSine <= std_logic_vector(lutSine_tmp);

END rtl;
