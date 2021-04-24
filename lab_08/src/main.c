#include <stdio.h>
#include <string.h>
#include <stdlib.h>


void _custom_strcpy(char *dst, char *src, int size);

int _custom_strlen(char *str)
{
    int ans;

    __asm__ (
        ".intel_syntax noprefix\n\t"
        "mov rax, %1 \n\t"
        "_loop: \n\t"
        "    cmpb [rax], 0 \n\t"
        "    je _endLoop \n\t"
        "    inc rax \n\t"
        "    jmp _loop \n\t"
        "_endLoop: \n\t"
        "sub rax, %1 \n\t"
        "mov %0, eax\n\t"
        : "=r"(ans) 
        : "r"(str)
        : "rax", "rdx"
    );

    return ans;
}

int main()
{
    char tmp[15] = "Hello, Dmitry!";
    char *src = "Anton!";

    char *dst = malloc(16);
    for (size_t i = 0; i < strlen(tmp) + 1; i++) 
        dst[i] = tmp[i];

    printf("dst = %s\n", dst);
    printf("src = %s\n", src);
   
    
    int size = (int)strlen(src);

    _custom_strcpy(dst+7, src, size);
    printf("dst=%s src=%s size=%zu\n", dst, src, sizeof(src));

    free(dst);

    // char tmp[15] = "Hello, Dmitry!";

    // char *dst = malloc(16);
    // for (size_t i = 0; i < strlen(tmp) + 1; i++) 
    //     dst[i] = tmp[i];

    // printf("dst = %s\n", dst);

    // _my_strcpy(dst, dst+4, 10);
    // printf("dst=[%s], size=%d\n", dst, 10);

    // free(dst);


    char *q = "Hel\0lo";

    printf("%d", _custom_strlen(q));

    return 0;
}