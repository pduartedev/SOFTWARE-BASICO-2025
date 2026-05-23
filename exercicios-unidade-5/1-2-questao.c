#include <stdio.h>

int quantidade_pares(int *v, int tam)
{
    int i, pares = 0;

    for(i = 0; i < tam; i++)
    {
        if(v[i] % 2 == 0)
        {
            pares++;
        }
    }

    return pares;
}

int main()
{
    int pares, vetor[10] = {-8, 1, 4, 23, 12, 67, 98, 2, 5, 9};

    pares = quantidade_pares(vetor, 10);

    return 0;
}