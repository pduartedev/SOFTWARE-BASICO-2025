#include <stdio.h>

int a;
int n;

int main()
{
    a = 15;
    
    if (a % 2 == 0)
    {
        n = 0;
    }
    else
    {
        n = 1;
    }
    
    printf("Valor de n: %d\n", n);

    return 0;
}