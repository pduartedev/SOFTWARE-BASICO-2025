#include <stdio.h>

unsigned char a = 255;
short int b = 7;
short int c = 10;
int d;
long int r;

int main()
{
    d = a;

    r = b + c - d % 20;

    printf("O resultado da expressão é: %ld\n", r);

    return 0;
}