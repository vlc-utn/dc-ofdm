create_project prj_ip {} -part xc7z010clg400-1 -force
set_property ip_repo_paths {../../} [current_fileset]

# Add HDL source files to project
add_files -norecurse {../hdl/payload_full_ip_src_payload_full_pac.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_payload_full_tc.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_psdu_size_to_payload_len.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_Sample_Control_Bus_Creator.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_Compare_To_Constant.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_tone_mapping.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_puncturer.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_payload_rep.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_batid_to_bits_per_subcarrier.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_valid_to_ctrl.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block1.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_p_scrambler.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_SimpleDualPortRAM_singlebit.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_BarrelRotator.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_Calculate_Alpha.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_Calculate_Parity.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_Final_Output.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_Hc_12S_B80.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_reduced_ldpc.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_rising_edge_detector.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_next_frame_to_ready.vhd}
add_files -norecurse {../hdl/payload_full_ip_src_payload_full.vhd}
add_files -norecurse {../hdl/payload_full_ip_reset_sync.vhd}
add_files -norecurse {../hdl/payload_full_ip_dut.vhd}
add_files -norecurse {../hdl/payload_full_ip_addr_decoder.vhd}
add_files -norecurse {../hdl/payload_full_ip_axi_lite_module.vhd}
add_files -norecurse {../hdl/payload_full_ip_axi_lite.vhd}
add_files -norecurse {../hdl/payload_full_ip.vhd}
set_property top payload_full_ip [get_filesets sources_1]
set_property top payload_full_ip [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Package IP from project
ipx::package_project -root_dir {../} -force

# Set IP properties
set_property name payload_full_ip [ipx::current_core]
set_property display_name payload_full_ip [ipx::current_core]
set_property version {1.0} [ipx::current_core]
set_property library {ip} [ipx::current_core]
set Families [split [lsort -uniq [get_property C_FAMILY [get_parts]]]]
set IPSupportedFamily {}
foreach family $Families {append IPSupportedFamily "{$family} {Production} "}
set_property supported_families $IPSupportedFamily [ipx::current_core]
set_property taxonomy {{/HDL Coder Generated IP}} [ipx::current_core]
set_property description {HDL Coder generated IP} [ipx::current_core]
set_property core_revision 2113714553 [ipx::current_core]

# Add HDL source files to IP
ipx::add_file {hdl/payload_full_ip_src_payload_full_pac.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_payload_full_pac.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_payload_full_pac.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_payload_full_pac.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_payload_full_tc.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_payload_full_tc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_payload_full_tc.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_payload_full_tc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_psdu_size_to_payload_len.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_psdu_size_to_payload_len.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_psdu_size_to_payload_len.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_psdu_size_to_payload_len.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Sample_Control_Bus_Creator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Sample_Control_Bus_Creator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Sample_Control_Bus_Creator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Sample_Control_Bus_Creator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Compare_To_Constant.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Compare_To_Constant.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Compare_To_Constant.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Compare_To_Constant.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_tone_mapping.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_tone_mapping.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_tone_mapping.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_tone_mapping.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_puncturer.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_puncturer.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_puncturer.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_puncturer.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_payload_rep.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_payload_rep.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_payload_rep.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_payload_rep.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_batid_to_bits_per_subcarrier.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_batid_to_bits_per_subcarrier.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_batid_to_bits_per_subcarrier.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_batid_to_bits_per_subcarrier.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_valid_to_ctrl.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_valid_to_ctrl.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_valid_to_ctrl.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_valid_to_ctrl.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Sample_Control_Bus_Creator_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_p_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_p_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_p_scrambler.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_p_scrambler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_BarrelRotator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_BarrelRotator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_BarrelRotator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_BarrelRotator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Calculate_Alpha.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Calculate_Alpha.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Calculate_Alpha.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Calculate_Alpha.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Calculate_Parity.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Calculate_Parity.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Calculate_Parity.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Calculate_Parity.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Final_Output.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Final_Output.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Final_Output.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Final_Output.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Hc_12S_B80.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Hc_12S_B80.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_Hc_12S_B80.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_Hc_12S_B80.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_reduced_ldpc.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_reduced_ldpc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_reduced_ldpc.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_reduced_ldpc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_rising_edge_detector.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_rising_edge_detector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_rising_edge_detector.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_rising_edge_detector.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_next_frame_to_ready.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_next_frame_to_ready.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_next_frame_to_ready.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_next_frame_to_ready.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_payload_full.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_payload_full.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_src_payload_full.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_src_payload_full.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_dut.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_dut.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_addr_decoder.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_addr_decoder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_addr_decoder.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_addr_decoder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_axi_lite_module.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_axi_lite_module.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_axi_lite_module.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_axi_lite_module.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_axi_lite.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_axi_lite.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip_axi_lite.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip_axi_lite.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/payload_full_ip.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/payload_full_ip.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]

# Add bus interfaces
ipx::remove_all_bus_interface [ipx::current_core]
ipx::remove_all_memory_map [ipx::current_core]
ipx::remove_all_address_space [ipx::current_core]
# AXI4_Lite Slave
ipx::add_bus_interface {AXI4_Lite} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:aximm_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:aximm:1.0} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
ipx::add_port_map {AWADDR} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWADDR} [ipx::get_port_maps AWADDR -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {AWVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWVALID} [ipx::get_port_maps AWVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WDATA} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WDATA} [ipx::get_port_maps WDATA -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WSTRB} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WSTRB} [ipx::get_port_maps WSTRB -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WVALID} [ipx::get_port_maps WVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BREADY} [ipx::get_port_maps BREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARADDR} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARADDR} [ipx::get_port_maps ARADDR -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARVALID} [ipx::get_port_maps ARVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RREADY} [ipx::get_port_maps RREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {AWREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWREADY} [ipx::get_port_maps AWREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WREADY} [ipx::get_port_maps WREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BRESP} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BRESP} [ipx::get_port_maps BRESP -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BVALID} [ipx::get_port_maps BVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARREADY} [ipx::get_port_maps ARREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RDATA} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RDATA} [ipx::get_port_maps RDATA -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RRESP} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RRESP} [ipx::get_port_maps RRESP -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RVALID} [ipx::get_port_maps RVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_bus_interface {AXI4_Lite_signal_clock} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ACLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_interface {AXI4_Lite_signal_reset} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_BUSIF} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property value {AXI4_Lite} [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property value {AXI4_Lite_ARESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]]
ipx::add_memory_map {AXI4_Lite} [ipx::current_core]
set_property slave_memory_map_ref {AXI4_Lite} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
ipx::add_address_block {reg0} [ipx::get_memory_maps AXI4_Lite -of_objects [ipx::current_core]]
set_property range {65536} [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps AXI4_Lite -of_objects [ipx::current_core]]]


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
ipx::add_file {doc/InBitPacking.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/InBitPacking.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/OutBitPacking.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/OutBitPacking.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/doc_arch_axi4_lite.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/doc_arch_axi4_lite.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/free_running.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/free_running.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/HDLPayloadFull_ip_core_report.html} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{html}} [ipx::get_files {doc/HDLPayloadFull_ip_core_report.html} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]

# Add C files
ipx::add_file_group -type {misc} {} [ipx::current_core]
ipx::add_file {include/payload_full_ip_addr.h} [ipx::get_file_groups xilinx_miscfiles -of_objects [ipx::current_core]]
set_property type {{cSource}} [ipx::get_files {include/payload_full_ip_addr.h} -of_objects [ipx::get_file_groups xilinx_miscfiles -of_objects [ipx::current_core]]]

# Package IP
ipx::create_xgui_files [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::archive_core {../payload_full_ip_v1_0.zip} [ipx::current_core]
close_project
exit
