# Define variables for your HLS kernel:
set projName "box_filter_proj"
set krnlName "hls_top"
set krnlFile "box_filter.cpp hls_top.cpp"
set solution "solution1"
set krnlTB "dummy_tb.cpp"
set krnlPlatform "xcu280-fsvh2892-2L-e"
#set krnlPlatform "xcu250-figd2104-2L-e"
set path "./xoFlow"

#Script to create and output HLS kernel
open_project $projName
set_top $krnlName
add_files $krnlFile
add_files -tb $krnlTB
open_solution $solution
set_part $krnlPlatform -tool vivado
create_clock -period 10 -name default
#config_vitis -optimization_level none -target xocc
config_sdx -optimization_level none -target xocc
config_export -vivado_optimization_level 0 -vivado_phys_opt none
config_compile -name_max_length 256 -pipeline_loops 64
config_schedule -enable_dsp_full_reg
#source "./hlsKernel/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -xo \
        $path/$krnlName.xo
exit
