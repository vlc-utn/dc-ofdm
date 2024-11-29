set diagram "tx_v10_i"

# Multycycle constraints for flip-flops in the OFDM modulator.
set ofdm_ff [list \
    get_cells -filter {IS_PRIMITIVE && IS_SEQUENTIAL} $diagram/IEEE_8021513_TX_0/U0/u_IEEE_8021513_TX_dut_inst/u_IEEE_8021513_TX_src_full_tx/u_full_ofdm_modulator/u_ofdm_modulator/* \
    get_cells -filter {IS_PRIMITIVE && IS_SEQUENTIAL} $diagram/IEEE_8021513_TX_0/U0/u_IEEE_8021513_TX_dut_inst/u_IEEE_8021513_TX_src_full_tx/u_full_ofdm_modulator/u_ofdm_modulator/*/* \
    get_cells -filter {IS_PRIMITIVE && IS_SEQUENTIAL} $diagram/IEEE_8021513_TX_0/U0/u_IEEE_8021513_TX_dut_inst/u_IEEE_8021513_TX_src_full_tx/u_full_ofdm_modulator/u_ofdm_modulator/*/*/* \
    get_cells -filter {IS_PRIMITIVE && IS_SEQUENTIAL} $diagram/IEEE_8021513_TX_0/U0/u_IEEE_8021513_TX_dut_inst/u_IEEE_8021513_TX_src_full_tx/u_full_ofdm_modulator/u_ofdm_modulator/*/*/*/* \
    get_cells -filter {IS_PRIMITIVE && IS_SEQUENTIAL} $diagram/IEEE_8021513_TX_0/U0/u_IEEE_8021513_TX_dut_inst/u_IEEE_8021513_TX_src_full_tx/u_full_ofdm_modulator/u_ofdm_modulator/*/*/*/*/* \
    get_cells -filter {IS_PRIMITIVE && IS_SEQUENTIAL} $diagram/IEEE_8021513_TX_0/U0/u_IEEE_8021513_TX_dut_inst/u_IEEE_8021513_TX_src_full_tx/u_full_ofdm_modulator/u_ofdm_modulator/*/*/*/*/*/* \
    get_cells -filter {IS_PRIMITIVE && IS_SEQUENTIAL} $diagram/IEEE_8021513_TX_0/U0/u_IEEE_8021513_TX_dut_inst/u_IEEE_8021513_TX_src_full_tx/u_full_ofdm_modulator/u_ofdm_modulator/*/*/*/*/*/*/* \
]
set_multicycle_path 2 -setup -from $ofdm_ff -to $ofdm_ff -quiet
set_multicycle_path 1 -hold -from $ofdm_ff -to $ofdm_ff -quiet


# Multycycle constraints for HDL FIFO slow path
set fifo_payload [list \
    get_cells -filter {IS_PRIMITIVE && IS_SEQUENTIAL} $diagram/IEEE_8021513_TX_0/U0/u_IEEE_8021513_TX_dut_inst/u_IEEE_8021513_TX_src_full_tx/u_payload_full/Delay13*/C \
]
set_multicycle_path 8 -setup -from $fifo_payload -quiet
set_multicycle_path 7 -hold -from $fifo_payload -quiet

