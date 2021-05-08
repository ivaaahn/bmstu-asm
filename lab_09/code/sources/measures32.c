#include "settings.h"

#include "measures32.h"

void calc_sum32(float a, float b, size_t count)
{
    float c;
    for (size_t i = 0; i < count; ++i)
        c = a + b;
}

#ifdef ASM
void calc_sum32_asm(float a, float b, size_t count)
{
    float c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "faddp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif

void calc_mul32(float a, float b, size_t count)
{
    float c;
    for (size_t i = 0; i < count; ++i)
        c = a * b;
}

#ifdef ASM
void calc_mul32_asm(float a, float b, size_t count)
{
    float c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "fmulp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif


static void print_sum32_info(float a, float b)
{
    clock_t begin = clock();
    calc_sum32(a, b, REPEATS);
    clock_t end = clock();

    printf(SUM_FMT, (double)(end - begin) / TO_NANOSEC / REPEATS);

#ifdef ASM
    begin = clock();
    calc_sum32_asm(a, b, REPEATS);
    end = clock();

    printf(SUM_FMT_ASM, (double)(end - begin) / TO_NANOSEC / REPEATS);
#endif
}

static void print_mul32_info(float a, float b)
{
    clock_t begin = clock();
    calc_mul32(a, b, REPEATS);
    clock_t end = clock();

    printf(MUL_FMT, (double)(end - begin) / TO_NANOSEC / REPEATS);

#ifdef ASM
    begin = clock();
    calc_mul32_asm(a, b, REPEATS);
    end = clock();
    printf(MUL_FMT_ASM, (double)(end - begin) / TO_NANOSEC / REPEATS);
#endif

}

void print_measures32()
{
    printf("FLOAT (%zu bits)\n\n", sizeof(float) * CHAR_BIT);

    float a = 2e43, b = 11e53;

    print_sum32_info(a, b);
    print_mul32_info(a, b);

    printf("===================\n");
}