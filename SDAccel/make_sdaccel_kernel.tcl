open_project box_filter_proj
set_top "hls_top"
add_files "box_filter.cpp hls_top.cpp"
add_files -tb dummy_tb.cpp
open_solution "solution1"
#set_part {xcu200-fsgd2104-2-e} -tool vivado
set_part {xcu250-figd2104-2L-e} -tool vivado
create_clock -period 10 -name default
config_sdx -optimization_level none -target xocc
config_schedule -effort medium -enable_dsp_full_reg
config_compile -name_max_length 256 -pipeline_loops 64
#source "./guiProj/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -xo \
     ./xoFlow/box_filter.xo
exit
