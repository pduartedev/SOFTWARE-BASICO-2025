#include <stdio.h>

long int a, b;

int soma(long int x, long int y)
{
    long int z;

    z = x + y;

    return (z);
}

int main()
{
    a = 4;
    b = 5;

    b = soma(a, b);

    return (b);
}