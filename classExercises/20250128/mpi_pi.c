#include <mpi.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
    int rank, size, i, n = 1000000;
    double h, x, pi, local_sum = 0.0, total_sum = 0.0;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    h = 1.0 / (double)n;

    for (i = rank; i < n; i += size) {
        x = h * ((double)i + 0.5);
        local_sum += 4.0 / (1.0 + x * x);
    }

    MPI_Reduce(&local_sum, &total_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

    if (rank == 0) {
        pi = h * total_sum;
        printf("Valor aproximado de Pi: %.16f\n", pi);
    }

    MPI_Finalize();
    return 0;
}

