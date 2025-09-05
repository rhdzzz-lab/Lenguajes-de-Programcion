#include <stdio.h>

int main() {
    int n, i;
    long long a = 0, b = 1, c;

    printf("Introduce el numero de terminos: ");
    scanf("%d", &n);

    printf("Serie de Fibonacci:\n");
    if (n >= 1) printf("%lld ", a);
    if (n >= 2) printf("%lld ", b);

    for (i = 3; i <= n; i++) {
        c = a + b;
        printf("%lld ", c);
        a = b;
        b = c;
    }
    printf("\n");

    printf("Presiona ENTER para salir...");
    getchar(); getchar(); // pausa
    return 0;
}
