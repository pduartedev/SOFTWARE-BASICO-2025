#include <stdio.h>

int vetor[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
int maior_elemento = 0;

int main ()
{
    for (int i = 0; i < 10; i++)
    {
        if(vetor[i] > maior_elemento)
        {
            maior_elemento = vetor[i];
        }
    }

    printf("Maior elemento: %d\n", maior_elemento);

    return 0;
}

