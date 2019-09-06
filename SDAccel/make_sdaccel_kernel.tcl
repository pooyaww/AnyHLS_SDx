open_project guiProj
set_top krnl_idct
add_files src/krnl_idct.cpp
add_files -tb src/idct.cpp
open_solution "solution1"
set_part {xcu200-fsgd2104-2-e} -tool vivado
create_clock -period 10 -name default
config_sdx -optimization_level none -target xocc
config_schedule -effort medium -enable_dsp_full_reg
config_compile -name_max_length 256 -pipeline_loops 64
#source "./guiProj/solution1/directives.tcl"
csim_designcsynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -xo \
     /wrk/bugs/xoFlow/idct_hls/krnl_idct.xo
