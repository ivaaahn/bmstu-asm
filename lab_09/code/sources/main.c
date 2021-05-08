#include <stdio.h>
#include <math.h>

#include "settings.h"

#include "measures32.h"
#include "measures64.h"

#ifdef X87
#include "measures80.h"
#endif

int main()
{
    print_measures_sin();

    print_measures32();

    print_measures64();

#ifdef X87
    print_measures80();
#endif

    return 0;
}
