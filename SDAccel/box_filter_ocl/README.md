## Box Filter
1. OpenCL kernel compilation flow using vivado_hls
Building xo file via vivado_hls using makefile  
`vivado_hls -f make_sdaccel_kernel.tcl`   
then linking xo files with platform to generate xclbin file   
`xocc -l --platform xilinx_u280_xdma_201910_1 box_filter.xo -o box_filter.xclbin`   
 or with Vitis:   
`v++ -l --platform xilinx_u280_xdma_201910_1 box_filter.xo -o box_filter.xclbin`
use xcpp for host code compilation   
run host code, passing xclbin file as its parameter

2. Directly building xclbin file by *XOCC* without calling vivado_hls   
`make build TARGET=hw DEVICE=xilinx_u280_xdma_201830_2`


----
### Poring HLS generated kernel to OpenCL flow

- SDAccel kernel must have one and only one s_axilite interface which will be used by host application to configure the kernel.
*bundle control* is defined which is s_axilite interface and associated with all the arguments (in, out,...),
- control interface must also be associated with "return".
- All the global memory access arguments must be associated to one m_axi(AXI Master Interface). All arguments(in, out,..) are
associated to bundle such as *gmem* which means that a AXI master interface named "gmem" will be created in Kernel and all these variables will be accessing global memory through this interface.
- Multiple interfaces can also be created based on the requirements. For example when multiple memory accessing arguments need access to global memory simultaneously, user can create multiple master interfaces and can connect to different arguments. for example budle=gmem1 and bundle=gmem2.
