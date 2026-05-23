#include <stdio.h>

int a;
int i;
int s;

int main()
{
    s = 0;
    a = 1;

    for(i = 1; i <= 10; i++)
    {
        s = s + a;
        a++;
    }

    printf("%d\n", s);

    return 0;
}