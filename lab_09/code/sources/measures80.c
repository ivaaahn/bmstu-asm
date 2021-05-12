#include "settings.h"

#include "measures80.h"

void calc_sum80(long double a, long double b, size_t count)
{
    long double c;
    for (size_t i = 0; i < count; ++i)
        c = a + b;
}

#ifdef ASM
void calc_sum80_asm(long double a, long double b, size_t count)
{
    long double c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "faddp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif

void calc_mul80(long double a, long double b, size_t count)
{
    long double c;
    for (size_t i = 0; i < count; ++i)
        c = a * b;
}

#ifdef ASM
void calc_mul80_asm(long double a, long double b, size_t count)
{
    long double c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "fmulp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif

static void print_sum80_info(long double a, long double b)
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

static void print_mul80_info(long double a, long double b)
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
    printf("long double  (%zu bits)\n\n", sizeof(long double) * CHAR_BIT);

    long double a = 2e43, b = 11e53;

    print_sum80_info(a, b);
    
    print_mul80_info(a, b);

    printf("===================\n");

}
