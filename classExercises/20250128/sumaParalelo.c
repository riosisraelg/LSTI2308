#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

#define N 100000000

int main() {
    double *a = (double*)malloc(N * sizeof(double));
    double suma = 0.0;
    double inicio, fin;

    // Inicializar el arreglo
    for (int i = 0; i < N; i++) {
        a[i] = (double)i * 2.0;
    }

    inicio = omp_get_wtime();

    // Suma paralela
    #pragma omp parallel for reduction(+:suma)
    for (int i = 0; i < N; i++) {
        suma += a[i];
    }

    fin = omp_get_wtime();
    double tiempo = fin - inicio;

    printf("Suma total: %f\n", suma);
    printf("Tiempo de ejecución con OpenMP: %f segundos\n", tiempo);

    free(a);
    return 0;
}

