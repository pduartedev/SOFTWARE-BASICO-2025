#include <stdio.h>

int vetor[10] = {7, 2, 3, 4, 5, 8, 9, 6, 0, 1};
int tam = 10;
int temp = 0;

int main()
{
    for(int i = 0; i < tam; i++)
    {
        for(int j = i + 1; j < tam; j++)
        {
            if(vetor[i] > vetor[j])
            {
                temp = vetor[i];
                vetor[i] = vetor[j];
                vetor[j] = temp;
            }
        }
    }

    printf("Vetor ordenado: ");
    for(int i = 0; i < tam; i++)
    {
        printf("%d ", vetor[i]);
    }
    printf("\n");

    return 0;
}