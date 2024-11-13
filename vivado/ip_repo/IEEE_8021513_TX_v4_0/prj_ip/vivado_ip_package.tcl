create_project prj_ip {} -part xc7z010clg400-1 -force
set_property ip_repo_paths {../../} [current_fileset]

# Add HDL source files to project
add_files -norecurse {../hdl/IEEE_8021513_TX_src_full_tx_pac.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_full_tx_tc.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_valid_to_ctrl.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_channel_gen.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_clock_crossing.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_falling_edge_detector.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_CRCGenControl.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_CRCGenCompute.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_h_crc.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_valid_to_ctrl_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_h_gen.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_h_repetition.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block3.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_h_scrambler.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_BarrelRotator.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Calculate_Alpha.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Calculate_Parity.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Final_Output.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Hc_12H_B14.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_header_fec.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_header_full.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_new_frame_rate_conversion.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_new_frame_rate_conversion1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_batid_to_bits_per_subcarrier.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_psdu_size_to_payload_length.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block4.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_tone_mapping.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block5.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_valid_to_ctrl_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_p_scrambler.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_BarrelRotator_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Calculate_Alpha_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Calculate_Parity_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Final_Output_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Hc_12S_B80.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_reduced_ldpc.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_rising_edge_detector.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_rising_edge_detector_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_next_frame_to_ready.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_payload_full.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block7.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_valid_to_ctrl_block2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_preamble_gen.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_reg_to_variable.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_rising_edge_detector_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_rising_edge_detector_block2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_signal_ack.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Zero1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_one_hot_coder.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_bits_selector.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_one_hot_coder_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_cp_len_creator.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant_block2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_one_hot_coder_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_init_selector.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_read_frame_from_ram.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_one_hot_coder_block2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_ram_formatting.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Compare_To_Zero.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_write_frame_to_ram.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_store_frame_in_ram.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_lfsr_const_scrambler.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_rotate.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_constellation_scrambler.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Mixer.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SinLookUpTableGen.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_CosLookUpTableGen.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_WaveformGen.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_NCO.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_frequency_upshift.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_falling_edge_detector_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FirRdyLogic.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block3.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block4.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block5.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block6.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block7.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block8.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FIRFilter1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FirRdyLogic_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block9.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FilterTapSystolic.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block10.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FilterTapSystolic_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FIRFilter2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_FIR_Interpolator.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_interpolator.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_symbolFormation.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_samplesRepetitionMod.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_DownSamplerMod.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_HDLFFTShiftMod.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_CPAddition.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_TWDLROM_3_1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_TWDLROM_5_1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_TWDLROM_7_1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX2FFT_bitNatural.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SDFCommutator1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SDFCommutator2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_2.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_3.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Complex4Multiply.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SDFCommutator3.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_3.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_4.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SDFCommutator4.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_4.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_5.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Complex4Multiply_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SDFCommutator5.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_5.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_6.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SDFCommutator6.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_6.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_7.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_Complex4Multiply_block1.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SDFCommutator7.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_7.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_8.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_SDFCommutator8.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_8.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_dsphdl_IFFT.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_OFDM_Modulator.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_ofdm_modulator_block.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_rising_edge_detector_block3.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_ofdm_ready_truncate.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_BPSK_Modulator_Baseband.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_qam_mod.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_HDL_FIFO.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_full_ofdm_modulator.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_src_full_tx.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_reset_sync.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX_dut.vhd}
add_files -norecurse {../hdl/IEEE_8021513_TX.vhd}

# Add Constraint files to project
add_files -norecurse {../constraint/IEEE_8021513_TX_src_full_tx_constraints.xdc}
set_property top IEEE_8021513_TX [get_filesets sources_1]
set_property top IEEE_8021513_TX [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Package IP from project
ipx::package_project -root_dir {../} -force

# Set IP properties
set_property name IEEE_8021513_TX [ipx::current_core]
set_property display_name IEEE_8021513_TX [ipx::current_core]
set_property version {4.0} [ipx::current_core]
set_property library {ip} [ipx::current_core]
set Families [split [lsort -uniq [get_property C_FAMILY [get_parts]]]]
set IPSupportedFamily {}
foreach family $Families {append IPSupportedFamily "{$family} {Production} "}
set_property supported_families $IPSupportedFamily [ipx::current_core]
set_property taxonomy {{/HDL Coder Generated IP}} [ipx::current_core]
set_property description {HDL Coder generated IP} [ipx::current_core]
set_property core_revision 0001000000 [ipx::current_core]

# Add HDL source files to IP
ipx::add_file {hdl/IEEE_8021513_TX_src_full_tx_pac.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_full_tx_pac.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_full_tx_pac.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_full_tx_pac.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_full_tx_tc.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_full_tx_tc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_full_tx_tc.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_full_tx_tc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_valid_to_ctrl.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_valid_to_ctrl.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_valid_to_ctrl.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_valid_to_ctrl.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_channel_gen.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_channel_gen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_channel_gen.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_channel_gen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_clock_crossing.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_clock_crossing.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_clock_crossing.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_clock_crossing.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_falling_edge_detector.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_falling_edge_detector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_falling_edge_detector.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_falling_edge_detector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_CRCGenControl.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_CRCGenControl.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_CRCGenControl.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_CRCGenControl.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_CRCGenCompute.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_CRCGenCompute.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_CRCGenCompute.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_CRCGenCompute.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_h_crc.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_h_crc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_h_crc.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_h_crc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_h_gen.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_h_gen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_h_gen.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_h_gen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_h_repetition.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_h_repetition.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_h_repetition.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_h_repetition.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_h_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_h_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_h_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_h_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_singlebit_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_BarrelRotator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_BarrelRotator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_BarrelRotator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_BarrelRotator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Calculate_Alpha.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Calculate_Alpha.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Calculate_Alpha.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Calculate_Alpha.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Calculate_Parity.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Calculate_Parity.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Calculate_Parity.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Calculate_Parity.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Final_Output.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Final_Output.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Final_Output.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Final_Output.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Hc_12H_B14.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Hc_12H_B14.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Hc_12H_B14.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Hc_12H_B14.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_header_fec.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_header_fec.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_header_fec.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_header_fec.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_header_full.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_header_full.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_header_full.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_header_full.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_new_frame_rate_conversion.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_new_frame_rate_conversion.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_new_frame_rate_conversion.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_new_frame_rate_conversion.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_new_frame_rate_conversion1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_new_frame_rate_conversion1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_new_frame_rate_conversion1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_new_frame_rate_conversion1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_batid_to_bits_per_subcarrier.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_batid_to_bits_per_subcarrier.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_batid_to_bits_per_subcarrier.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_batid_to_bits_per_subcarrier.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_psdu_size_to_payload_length.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_psdu_size_to_payload_length.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_psdu_size_to_payload_length.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_psdu_size_to_payload_length.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_tone_mapping.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_tone_mapping.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_tone_mapping.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_tone_mapping.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_p_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_p_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_p_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_p_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_BarrelRotator_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_BarrelRotator_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_BarrelRotator_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_BarrelRotator_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Calculate_Alpha_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Calculate_Alpha_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Calculate_Alpha_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Calculate_Alpha_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Calculate_Parity_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Calculate_Parity_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Calculate_Parity_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Calculate_Parity_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Final_Output_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Final_Output_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Final_Output_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Final_Output_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Hc_12S_B80.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Hc_12S_B80.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Hc_12S_B80.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Hc_12S_B80.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_reduced_ldpc.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_reduced_ldpc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_reduced_ldpc.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_reduced_ldpc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_next_frame_to_ready.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_next_frame_to_ready.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_next_frame_to_ready.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_next_frame_to_ready.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_payload_full.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_payload_full.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_payload_full.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_payload_full.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Sample_Control_Bus_Creator_block7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_valid_to_ctrl_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_preamble_gen.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_preamble_gen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_preamble_gen.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_preamble_gen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_reg_to_variable.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_reg_to_variable.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_reg_to_variable.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_reg_to_variable.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_signal_ack.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_signal_ack.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_signal_ack.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_signal_ack.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Zero1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Zero1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Zero1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Zero1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_one_hot_coder.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_one_hot_coder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_one_hot_coder.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_one_hot_coder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_bits_selector.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_bits_selector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_bits_selector.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_bits_selector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_one_hot_coder_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_one_hot_coder_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_one_hot_coder_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_one_hot_coder_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_cp_len_creator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_cp_len_creator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_cp_len_creator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_cp_len_creator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant1_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Constant2_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_one_hot_coder_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_one_hot_coder_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_one_hot_coder_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_one_hot_coder_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_init_selector.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_init_selector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_init_selector.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_init_selector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_read_frame_from_ram.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_read_frame_from_ram.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_read_frame_from_ram.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_read_frame_from_ram.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_one_hot_coder_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_one_hot_coder_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_one_hot_coder_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_one_hot_coder_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_ram_formatting.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_ram_formatting.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_ram_formatting.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_ram_formatting.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Zero.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Zero.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Compare_To_Zero.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Compare_To_Zero.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_write_frame_to_ram.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_write_frame_to_ram.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_write_frame_to_ram.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_write_frame_to_ram.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_store_frame_in_ram.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_store_frame_in_ram.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_store_frame_in_ram.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_store_frame_in_ram.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_lfsr_const_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_lfsr_const_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_lfsr_const_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_lfsr_const_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rotate.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rotate.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rotate.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rotate.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_constellation_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_constellation_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_constellation_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_constellation_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Mixer.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Mixer.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Mixer.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Mixer.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SinLookUpTableGen.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SinLookUpTableGen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SinLookUpTableGen.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SinLookUpTableGen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_CosLookUpTableGen.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_CosLookUpTableGen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_CosLookUpTableGen.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_CosLookUpTableGen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_WaveformGen.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_WaveformGen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_WaveformGen.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_WaveformGen.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_NCO.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_NCO.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_NCO.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_NCO.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_frequency_upshift.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_frequency_upshift.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_frequency_upshift.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_frequency_upshift.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_falling_edge_detector_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_falling_edge_detector_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_falling_edge_detector_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_falling_edge_detector_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FirRdyLogic.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FirRdyLogic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FirRdyLogic.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FirRdyLogic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FilterTapSystolicPreAdd_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FIRFilter1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FIRFilter1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FIRFilter1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FIRFilter1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FirRdyLogic_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FirRdyLogic_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FirRdyLogic_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FirRdyLogic_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block9.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block9.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block9.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FilterTapSystolic.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FilterTapSystolic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FilterTapSystolic.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FilterTapSystolic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block10.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block10.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Addressable_Delay_Line_block10.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FilterTapSystolic_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FilterTapSystolic_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FilterTapSystolic_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FilterTapSystolic_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FIRFilter2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FIRFilter2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FIRFilter2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FIRFilter2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FIR_Interpolator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FIR_Interpolator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_FIR_Interpolator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_FIR_Interpolator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_interpolator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_interpolator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_interpolator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_interpolator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_symbolFormation.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_symbolFormation.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_symbolFormation.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_symbolFormation.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_samplesRepetitionMod.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_samplesRepetitionMod.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_samplesRepetitionMod.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_samplesRepetitionMod.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_DownSamplerMod.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_DownSamplerMod.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_DownSamplerMod.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_DownSamplerMod.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_HDLFFTShiftMod.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_HDLFFTShiftMod.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_HDLFFTShiftMod.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_HDLFFTShiftMod.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_CPAddition.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_CPAddition.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_CPAddition.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_CPAddition.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_TWDLROM_3_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_TWDLROM_3_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_TWDLROM_3_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_TWDLROM_3_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_TWDLROM_5_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_TWDLROM_5_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_TWDLROM_5_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_TWDLROM_5_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_TWDLROM_7_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_TWDLROM_7_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_TWDLROM_7_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_TWDLROM_7_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX2FFT_bitNatural.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX2FFT_bitNatural.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX2FFT_bitNatural.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX2FFT_bitNatural.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Complex4Multiply.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Complex4Multiply.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Complex4Multiply.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Complex4Multiply.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Complex4Multiply_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Complex4Multiply_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Complex4Multiply_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Complex4Multiply_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Complex4Multiply_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Complex4Multiply_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_Complex4Multiply_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_Complex4Multiply_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_7.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_7.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF1_7.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_CTRL1_8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_SDFCommutator8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_SDFCommutator8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_8.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_8.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_RADIX22FFT_SDF2_8.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_dsphdl_IFFT.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_dsphdl_IFFT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_dsphdl_IFFT.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_dsphdl_IFFT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_OFDM_Modulator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_OFDM_Modulator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_OFDM_Modulator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_OFDM_Modulator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_ofdm_modulator_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_ofdm_modulator_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_ofdm_modulator_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_ofdm_modulator_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_rising_edge_detector_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_rising_edge_detector_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_ofdm_ready_truncate.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_ofdm_ready_truncate.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_ofdm_ready_truncate.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_ofdm_ready_truncate.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_BPSK_Modulator_Baseband.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_BPSK_Modulator_Baseband.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_BPSK_Modulator_Baseband.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_BPSK_Modulator_Baseband.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_qam_mod.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_qam_mod.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_qam_mod.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_qam_mod.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_HDL_FIFO.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_HDL_FIFO.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_HDL_FIFO.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_HDL_FIFO.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_full_ofdm_modulator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_full_ofdm_modulator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_full_ofdm_modulator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_full_ofdm_modulator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_full_tx.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_full_tx.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_src_full_tx.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_src_full_tx.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_dut.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX_dut.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/IEEE_8021513_TX.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/IEEE_8021513_TX.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]

# Add MCP constraint file(s) to IP
ipx::add_file {constraint/IEEE_8021513_TX_src_full_tx_constraints.xdc} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{xdcFile}} [ipx::get_files {constraint/IEEE_8021513_TX_src_full_tx_constraints.xdc} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]

# Add bus interfaces
ipx::remove_all_bus_interface [ipx::current_core]
ipx::remove_all_memory_map [ipx::current_core]
ipx::remove_all_address_space [ipx::current_core]

# Add IP clock and reset definition
ipx::add_bus_interface {IPCORE_CLK} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_CLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_interface {IPCORE_RESETN} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_RESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property value {IPCORE_RESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]


# Add report files
ipx::add_file_group -type {product_guide} {} [ipx::current_core]
ipx::add_file {doc/HDLTx_ip_core_report.html} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{html}} [ipx::get_files {doc/HDLTx_ip_core_report.html} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]

# Add FPGA Data Capture files
ipx::add_file_group -type {xilinx_examples} {} [ipx::current_core]
ipx::add_file_group -type {xilinx_implementation} {} [ipx::current_core]
ipx::add_file {fpga_data_capture/FPGADataCapture.m} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/FPGADataCapture.m} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/FPGADataCapture_model.slx} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/FPGADataCapture_model.slx} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/FPGA_Data_Capture_Component_Generation_Report.html} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/FPGA_Data_Capture_Component_Generation_Report.html} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/JTAG_Debug_hub.png} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/JTAG_Debug_hub.png} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/Workflow2.png} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/Workflow2.png} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]
ipx::add_file {fpga_data_capture/launchDataCaptureApp.m} [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]
set_property type {{matlab}} [ipx::get_files {fpga_data_capture/launchDataCaptureApp.m} -of_objects [ipx::get_file_groups xilinx_examples -of_objects [ipx::current_core]]]

# Package IP
ipx::create_xgui_files [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::archive_core {../IEEE_8021513_TX_v4_0.zip} [ipx::current_core]
close_project
exit
