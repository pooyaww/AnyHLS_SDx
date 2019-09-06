open_project vadd_opencl
set_top vadd
add_files vadd_opencl/solution1/vadd.cl
open_solution "solution1"
set_part {xczu7ev-ffvc1156-2-e} -tool vivado
create_clock -period 10 -name default
config_sdx -optimization_level none -target xocc
#source "./vadd_opencl/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
