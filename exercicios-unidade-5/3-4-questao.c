#include <stdio.h>

long int maior_elemento(long int *v, int tam)
{
    int i;
    long int maior;
    maior = v[0];

    for(i = 1; i < tam; i++)
    {
        if (maior < v[i])
        {
            maior = v[i];
        }
    }

    return maior;
}

int main()
{
    long int maior, vetor[10] = {-8, 1, 4, 23, 12, 67, 98, 2, 5, 9};

    maior = maior_elemento(vetor, 10);

    return 0;
}