#include "dot_product_c.h"

void dot_product_c(double *res, const DoubleVector *a, const DoubleVector *b, int size)
{
    for (const DoubleVector *a_end = a + size; a < a_end; ++a, ++b)
    {
        *(res++) =
            (*a)[0] * (*b)[0] +
            (*a)[1] * (*b)[1] +
            (*a)[2] * (*b)[2] +
            (*a)[3] * (*b)[3];
    }
}
