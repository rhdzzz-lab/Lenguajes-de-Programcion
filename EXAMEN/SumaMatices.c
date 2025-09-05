#include <stdio.h>

#define MAX 10

int main() {
    int A[MAX][MAX], B[MAX][MAX], C[MAX][MAX];
    int n, m, i, j;

    printf("Introduce numero de filas (max 10): ");
    scanf("%d", &n);
    printf("Introduce numero de columnas (max 10): ");
    scanf("%d", &m);

    printf("Introduce los elementos de la matriz A:\n");
    for (i = 0; i < n; i++)
        for (j = 0; j < m; j++)
            scanf("%d", &A[i][j]);

    printf("Introduce los elementos de la matriz B:\n");
    for (i = 0; i < n; i++)
        for (j = 0; j < m; j++)
            scanf("%d", &B[i][j]);

    // suma
    for (i = 0; i < n; i++)
        for (j = 0; j < m; j++)
            C[i][j] = A[i][j] + B[i][j];

    printf("Resultado (A+B):\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < m; j++)
            printf("%6d", C[i][j]);
        printf("\n");
    }

    printf("Presiona ENTER para salir...");
    getchar(); getchar();
    return 0;
}
