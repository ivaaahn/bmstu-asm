nasm -felf64 -o custom_strcpy.o custom_strcpy.s
gcc -c -masm=intel -o main.o main.c
gcc main.o custom_strcpy.o