#include "settings.h"

#include "measures80.h"

void calc_sum80(__float80 a, __float80 b, size_t count)
{
    __float80 c;
    for (size_t i = 0; i < count; ++i)
        c = a + b;
}

#ifdef ASM
void calc_sum80_asm(__float80 a, __float80 b, size_t count)
{
    __float80 c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "faddp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif

void calc_mul80(__float80 a, __float80 b, size_t count)
{
    __float80 c;
    for (size_t i = 0; i < count; ++i)
        c = a * b;
}

#ifdef ASM
void calc_mul80_asm(__float80 a, __float80 b, size_t count)
{
    __float80 c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "fmulp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif

static void print_sum80_info(__float80 a, __float80 b)
{
    clock_t begin = clock();
    calc_sum80(a, b, REPEATS);
    clock_t end = clock();

    printf(SUM_FMT, (double)(end - begin) / TO_NANOSEC / REPEATS);

#ifdef ASM
    begin = clock();
    calc_sum80_asm(a, b, REPEATS);
    end = clock();

    printf(SUM_FMT_ASM, (double)(end - begin) / TO_NANOSEC / REPEATS);
#endif
}

static void print_mul80_info(__float80 a, __float80 b)
{
    clock_t begin = clock();
    calc_mul80(a, b, REPEATS);
    clock_t end = clock();

    printf(MUL_FMT, (double)(end - begin) / TO_NANOSEC / REPEATS);

#ifdef ASM
    begin = clock();
    calc_mul80_asm(a, b, REPEATS);
    end = clock();
    printf(MUL_FMT_ASM, (double)(end - begin) / TO_NANOSEC / REPEATS);
#endif
}

void print_measures80()
{   
    printf("__FLOAT80 (%zu bits)\n\n", sizeof(__float80) * CHAR_BIT);

    __float80 a = 2e43, b = 11e53;

    print_sum80_info(a, b);
    
    print_mul80_info(a, b);

    printf("===================\n");

}
