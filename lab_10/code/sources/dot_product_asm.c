#include "dot_product_asm.h"


void dot_product_asm(double *res, const DoubleVector *a, const DoubleVector *b, int size)
{
    const DoubleVector *a_end = a + size - 1;
    while(a < a_end) {
        asm(
            "vmovupd ymm0, %1\n"
            "vmovupd ymm1, %2\n"
            "vmovupd ymm2, %3\n"
            "vmovupd ymm3, %4\n"
            "vmulpd ymm0, ymm0, ymm1\n"
            "vmulpd ymm2, ymm2, ymm3\n"
            "vhaddpd ymm1, ymm0, ymm2\n"
            "vextractf128 xmm3, ymm1, 1\n"
            "vaddpd ymm0, ymm1, ymm3\n"
            "movupd xmmword ptr [%0], xmm0\n"
            :
            : "r"(res), "m"(*a), "m"(*b), "m"(*(a + 1)), "m"(*(b + 1))
            : "ymm0", "ymm1", "ymm2", "ymm3");

        a += 2, b += 2, res += 2;
    }
}
