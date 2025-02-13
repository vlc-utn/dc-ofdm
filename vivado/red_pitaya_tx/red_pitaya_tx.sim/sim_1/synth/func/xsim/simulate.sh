#!/usr/bin/env bash
# ****************************************************************************
# Vivado (TM) v2023.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Tue Nov 19 00:23:28 -03 2024
# SW Build 4029153 on Fri Oct 13 20:13:54 MDT 2023
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tx_v10_tb_func_synth -key {Post-Synthesis:sim_1:Functional:tx_v10_tb} -tclbatch tx_v10_tb.tcl -protoinst "protoinst_files/tx_v10.protoinst" -view /home/cotti/Desktop/Proyecto_final/vlc_utn/dc-ofdm/vivado/red_pitaya_tx/dut_tb_behav.wcfg -log simulate.log"
xsim tx_v10_tb_func_synth -key {Post-Synthesis:sim_1:Functional:tx_v10_tb} -tclbatch tx_v10_tb.tcl -protoinst "protoinst_files/tx_v10.protoinst" -view /home/cotti/Desktop/Proyecto_final/vlc_utn/dc-ofdm/vivado/red_pitaya_tx/dut_tb_behav.wcfg -log simulate.log

