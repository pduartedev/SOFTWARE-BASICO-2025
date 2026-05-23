unsigned char a;
unsigned char b;

#include <stdio.h>


int main()
{
    a = 3;

    switch (a)
    {
    case 1:
        b = 10;
        break;

    case 2:
        b = 20;
        break;
    
    case 3:
        b = 30;
        break;
    }

    return 0;
}