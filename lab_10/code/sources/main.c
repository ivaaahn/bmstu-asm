#include <stdlib.h>
#include <stdio.h>

#include "dot_product_c.h"
#include "dot_product_asm.h"
#include "measure.h"

int main(void)
{
    printf("asm:");
    measure(dot_product_asm);
    printf("c:");
    measure(dot_product_c);

    return EXIT_SUCCESS;
}
