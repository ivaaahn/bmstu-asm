#include "settings.h"

#include "measures64.h"

void calc_sum64(double a, double b, size_t count)
{
    double c;
    for (size_t i = 0; i < REPEATS; ++i)
        c = a + b;
}

#ifdef ASM
void calc_sum64_asm(double a, double b, size_t count)
{
    double c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "faddp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif

void calc_mul64(double a, double b, size_t count)
{
    double c;
    for (size_t i = 0; i < REPEATS; ++i)
        c = a * b;
}

#ifdef ASM
void calc_mul64_asm(double a, double b, size_t count)
{
    double c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "fmulp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif


static void print_sum64_info(double a, double b)
{
    clock_t begin = clock();
    calc_sum64(a, b, REPEATS);
    clock_t end = clock();

    printf(SUM_FMT, (double)(end - begin) / TO_NANOSEC / REPEATS);

#ifdef ASM
    begin = clock();
    calc_sum64_asm(a, b, REPEATS);
    end = clock();

    printf(SUM_FMT_ASM, (double)(end - begin) / TO_NANOSEC / REPEATS);
#endif
}

static void print_mul64_info(double a, double b)
{
    clock_t begin = clock();
    calc_mul64(a, b, REPEATS);
    clock_t end = clock();

    printf(MUL_FMT, (double)(end - begin) / TO_NANOSEC / REPEATS);

#ifdef ASM
    begin = clock();
    calc_mul64_asm(a, b, REPEATS);
    end = clock();
    printf(MUL_FMT_ASM, (double)(end - begin) / TO_NANOSEC / REPEATS);
#endif

}

void print_measures64()
{
    printf("DOUBLE (%zu bits)\n\n", sizeof(double) * CHAR_BIT);

    double a = 2e43, b = 11e53;

    print_sum64_info(a, b);
    print_mul64_info(a, b);

    printf("===================\n");
}
