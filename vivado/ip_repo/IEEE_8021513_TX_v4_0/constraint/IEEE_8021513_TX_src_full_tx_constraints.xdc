# Multicycle constraints for clock enable: full_tx_tc.u1_d2_o0
set enbregcell [get_cells -hier -filter {mcp_info=="full_tx_tc.u1_d2_o0"}]
set enbregnet [get_nets -of_objects [get_pins -of_objects $enbregcell -filter {DIRECTION == OUT}]]
set reglist1 [get_cells -of [filter [all_fanout -flat -endpoints_only $enbregnet] IS_ENABLE]]
set_multicycle_path 2 -setup -from $reglist1 -to $reglist1 -quiet
set_multicycle_path 1 -hold -from $reglist1 -to $reglist1 -quiet

# Multicycle constraints for clock enable: full_tx_tc.u1_d2_o1
set enbregcell [get_cells -hier -filter {mcp_info=="full_tx_tc.u1_d2_o1"}]
set enbregnet [get_nets -of_objects [get_pins -of_objects $enbregcell -filter {DIRECTION == OUT}]]
set reglist2 [get_cells -of [filter [all_fanout -flat -endpoints_only $enbregnet] IS_ENABLE]]
set_multicycle_path 2 -setup -from $reglist2 -to $reglist2 -quiet
set_multicycle_path 1 -hold -from $reglist2 -to $reglist2 -quiet

# Multicycle constraints for clock enable: full_tx_tc.u1_d8_o0
set enbregcell [get_cells -hier -filter {mcp_info=="full_tx_tc.u1_d8_o0"}]
set enbregnet [get_nets -of_objects [get_pins -of_objects $enbregcell -filter {DIRECTION == OUT}]]
set reglist3 [get_cells -of [filter [all_fanout -flat -endpoints_only $enbregnet] IS_ENABLE]]
set_multicycle_path 8 -setup -from $reglist3 -to $reglist3 -quiet
set_multicycle_path 7 -hold -from $reglist3 -to $reglist3 -quiet

# Multicycle constraints for clock enable: full_tx_tc.u1_d8_o1
set enbregcell [get_cells -hier -filter {mcp_info=="full_tx_tc.u1_d8_o1"}]
set enbregnet [get_nets -of_objects [get_pins -of_objects $enbregcell -filter {DIRECTION == OUT}]]
set reglist4 [get_cells -of [filter [all_fanout -flat -endpoints_only $enbregnet] IS_ENABLE]]
set_multicycle_path 8 -setup -from $reglist4 -to $reglist4 -quiet
set_multicycle_path 7 -hold -from $reglist4 -to $reglist4 -quiet

# Multicycle constraints from clock enable: full_tx_tc.u1_d2_o1 to clock enable: full_tx_tc.u1_d2_o0
set_multicycle_path 1 -setup -from $reglist2 -to $reglist1 -quiet
set_multicycle_path 1 -hold -from $reglist2 -to $reglist1 -quiet

# Multicycle constraints from clock enable: full_tx_tc.u1_d2_o0 to clock enable: full_tx_tc.u1_d2_o1
set_multicycle_path 3 -setup -from $reglist1 -to $reglist2 -quiet
set_multicycle_path 1 -hold -from $reglist1 -to $reglist2 -quiet

# Multicycle constraints from clock enable: full_tx_tc.u1_d8_o1 to clock enable: full_tx_tc.u1_d8_o0
set_multicycle_path 7 -setup -from $reglist4 -to $reglist3 -quiet
set_multicycle_path 7 -hold -from $reglist4 -to $reglist3 -quiet

# Multicycle constraints from clock enable: full_tx_tc.u1_d8_o0 to clock enable: full_tx_tc.u1_d8_o1
set_multicycle_path 9 -setup -from $reglist3 -to $reglist4 -quiet
set_multicycle_path 7 -hold -from $reglist3 -to $reglist4 -quiet

