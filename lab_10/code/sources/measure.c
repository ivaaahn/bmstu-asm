#include <stdlib.h>
#include <time.h>

#include "measure.h"
#include "settings.h"

#define GET_RND ((double)rand() / (double)(RAND_MAX))

typedef void dot_product_implement(double *, const DoubleVector *, const DoubleVector *, int);

void measure(dot_product_implement *dot_prod)
{
    DoubleVector a[ARRAY_SIZE], b[ARRAY_SIZE];

    for (int i = 0; i < ARRAY_SIZE; ++i)
    {
        a[i][0] = GET_RND;
        a[i][1] = GET_RND;
        a[i][2] = GET_RND;
        a[i][3] = GET_RND;

        b[i][0] = GET_RND;
        b[i][1] = GET_RND;
        b[i][2] = GET_RND;
        b[i][3] = GET_RND;
    }

    double res[ARRAY_SIZE];

    clock_t start = clock();

    for (int m = 0; m < MEASUREMENT_REPEATS; ++m) {
        dot_prod(res, a, b, ARRAY_SIZE);
    }

    clock_t end = clock();

    printf("\t%.3g µs\n", ((double)(end - start)) / CLOCKS_PER_SEC / MEASUREMENT_REPEATS * 1000000);
}