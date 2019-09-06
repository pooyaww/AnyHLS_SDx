#include <clc.h>
__kernel void __attribute__ ((reqd_work_group_size(128,1,1)))
vadd( __global int *a, __global int *b, __global int *c) {
    int i = get_global_id(0);
    c[i] = a[i] + b[i];
}
