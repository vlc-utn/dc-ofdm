#!/usr/bin/env bash
# ****************************************************************************
# Vivado (TM) v2024.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sat Nov 23 14:29:55 -03 2024
# SW Build 5076996 on Wed May 22 18:36:09 MDT 2024
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim full_rx_tb_func_impl -key {Post-Implementation:sim_1:Functional:full_rx_tb} -tclbatch full_rx_tb.tcl -protoinst "protoinst_files/full_rx.protoinst" -view /home/cotti/Desktop/Proyecto_final/vlc_utn/dc-ofdm/vivado/red_pitaya_rx/full_rx_tb_behav.wcfg -log simulate.log"
xsim full_rx_tb_func_impl -key {Post-Implementation:sim_1:Functional:full_rx_tb} -tclbatch full_rx_tb.tcl -protoinst "protoinst_files/full_rx.protoinst" -view /home/cotti/Desktop/Proyecto_final/vlc_utn/dc-ofdm/vivado/red_pitaya_rx/full_rx_tb_behav.wcfg -log simulate.log

