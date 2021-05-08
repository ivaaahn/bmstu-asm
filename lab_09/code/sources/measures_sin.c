#include "settings.h"
#include <math.h>

void print_measures_sin()
{
    double res = 0.0;

    printf("\tsin(pi)\n");
    printf("3.14\t\t:\t%g\n", sin(3.14));
    printf("3.141596\t:\t%g\n", sin(3.141596));

    asm("fldpi\n"
        "fsin\n"
        "fstp %0\n" ::"m"(res));
    printf("FPU\t\t:\t%g\n", res);

    printf("\n");

    printf("\tsin(pi / 2)\n");
    printf("3.14 / 2\t:\t%g\n", sin(3.14 / 2));
    printf("3.141596 / 2\t:\t%g\n", sin(3.141596 / 2));

    res = 2.0;
    asm("fldpi\n"
        "fld %1\n"
        "fdivp\n"
        "fsin\n"
        "fstp %0\n"
        : "=m"(res)
        : "m"(res));
    printf("FPU\t\t:\t%g\n", res);

    printf("\n");
}