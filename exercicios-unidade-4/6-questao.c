#include <stdio.h>

int vetor[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
int tam = 10;
int conta_par = 0;

int main ()
{
    for (int i = 0; i < tam; i++)
    {
        if ((vetor[i] % 2 == 0))
        {
            conta_par++;
        }
    }

    printf("Quantidade de pares: %d\n", conta_par);

    return 0;
}