#pragma once

#include <limits.h>

#include <stddef.h>

#include <time.h>

#include <stdio.h>

#define REPEATS 1000000000

#define TO_NANOSEC (CLOCKS_PER_SEC / 1e9)

#define SUM_FMT "[+]     %-5.3g ns\n"
#define MUL_FMT "[*]     %-5.3g ns\n"

#define SUM_FMT_ASM "[+] asm %-5.3g ns\n"
#define MUL_FMT_ASM "[*] asm %-5.3g ns\n"
