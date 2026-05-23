#include <stdio.h>

int a;
int i;
int s;

int main()
{
    s = 0;
    a = 1;
    i = 1;

    while(i <= 10)
    {
        if(a % 2 == 0)
        {
            s = s + a;
        }

        a++;
        i++;
    }

    printf("%d\n", s);  

    return 0;
}