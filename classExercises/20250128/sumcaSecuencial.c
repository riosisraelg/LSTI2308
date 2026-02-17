#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100000000

int main() {
    double *a = (double*)malloc(N * sizeof(double));
    double suma = 0.0;
    clock_t inicio, fin;
    double tiempo;

    // Inicializar el arreglo
    for (int i = 0; i < N; i++) {
        a[i] = (double)i * 2.0;
    }

    inicio = clock();

    // Suma secuencial
    for (int i = 0; i < N; i++) {
        suma += a[i];
    }

    fin = clock();
    tiempo = (double)(fin - inicio) / CLOCKS_PER_SEC;

    printf("Suma total: %f\n", suma);
    printf("Tiempo de ejecución: %f segundos\n", tiempo);

    free(a);
    return 0;
}

