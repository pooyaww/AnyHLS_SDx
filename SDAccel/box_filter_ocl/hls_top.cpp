#include "box_filter.h"
// Kernel for xocc and SDAccel
void hls_top(int hls_top_446886[1048576], int hls_top_446887[1048576]) {
#pragma HLS INTERFACE m_axi     port=hls_top_446886 offset=slave bundle=p0
#pragma HLS INTERFACE s_axilite port=hls_top_446886              bundle=control

#pragma HLS INTERFACE m_axi     port=hls_top_446887 offset=slave bundle=p1
#pragma HLS INTERFACE s_axilite port=hls_top_446887              bundle=control

#pragma HLS INTERFACE s_axilite port=return                      bundle=control
    lambda_430429(hls_top_446886, hls_top_446887);

}

