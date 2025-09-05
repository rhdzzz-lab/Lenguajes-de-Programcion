#include <stdio.h>

int main() {
    int n, i;

    printf("Introduce un numero: ");
    scanf("%d", &n);

    printf("Tabla de multiplicar del %d\n", n);
    for (i = 1; i <= 10; i++) {
        printf("%d x %d = %d\n", n, i, n * i);
    }

    printf("Presiona ENTER para salir...");
    getchar(); getchar(); // pausa
    return 0;
}
