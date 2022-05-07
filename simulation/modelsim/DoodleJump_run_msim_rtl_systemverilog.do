transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib doodlejump_soc
vmap doodlejump_soc doodlejump_soc
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/doodlejump_soc.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_avalon_st_adapter_005.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_usb_rst.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_timer_0.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_sysid_qsys_0.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_spi_0.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_sdram.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_onchip_memory2_0.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_nios2_gen2_0.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_nios2_gen2_0_cpu.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_nios2_gen2_0_cpu_debug_slave_sysclk.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_nios2_gen2_0_cpu_debug_slave_tck.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_nios2_gen2_0_cpu_debug_slave_wrapper.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_nios2_gen2_0_cpu_test_bench.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_leds_pio.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_keycode.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_key.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_jtag_uart_0.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_hex_digits_pio.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_altpll_0.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_accumulate.v}
vlog -sv -work work +incdir+C:/Users/gally/Desktop/Doodle-Jump/svfiles {C:/Users/gally/Desktop/Doodle-Jump/svfiles/LFSR.sv}
vlog -sv -work work +incdir+C:/Users/gally/Desktop/Doodle-Jump/svfiles {C:/Users/gally/Desktop/Doodle-Jump/svfiles/VGA_controller.sv}
vlog -sv -work work +incdir+C:/Users/gally/Desktop/Doodle-Jump/svfiles {C:/Users/gally/Desktop/Doodle-Jump/svfiles/jumpstate.sv}
vlog -sv -work work +incdir+C:/Users/gally/Desktop/Doodle-Jump/svfiles {C:/Users/gally/Desktop/Doodle-Jump/svfiles/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/gally/Desktop/Doodle-Jump/svfiles {C:/Users/gally/Desktop/Doodle-Jump/svfiles/doodlejumpcharacter.sv}
vlog -sv -work work +incdir+C:/Users/gally/Desktop/Doodle-Jump/svfiles {C:/Users/gally/Desktop/Doodle-Jump/svfiles/doodlejump.sv}
vlog -sv -work work +incdir+C:/Users/gally/Desktop/Doodle-Jump/svfiles {C:/Users/gally/Desktop/Doodle-Jump/svfiles/counter.sv}
vlog -sv -work work +incdir+C:/Users/gally/Desktop/Doodle-Jump/svfiles {C:/Users/gally/Desktop/Doodle-Jump/svfiles/Color_Mapper.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_irq_mapper.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_avalon_st_adapter_005_error_adapter_0.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_avalon_st_handshake_clock_crosser.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_avalon_st_clock_crosser.v}
vlog -vlog01compat -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_std_synchronizer_nocut.v}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_width_adapter.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_burst_adapter.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_burst_adapter_uncmpr.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_router_007.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_router_002.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/doodlejump_soc_mm_interconnect_0_router.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work doodlejump_soc +incdir+C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules {C:/Users/gally/Desktop/Doodle-Jump/doodlejump_soc/synthesis/submodules/altera_merlin_master_translator.sv}

