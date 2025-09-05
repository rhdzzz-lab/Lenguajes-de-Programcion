#include <stdio.h>

int main() {
    int n, i, num, mayor, menor;

    printf("Cuantos numeros quieres ingresar? ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Cantidad invalida.\n");
        return 0;
    }

    printf("Introduce el numero 1: ");
    scanf("%d", &num);
    mayor = num;
    menor = num;

    for (i = 2; i <= n; i++) {
        printf("Introduce el numero %d: ", i);
        scanf("%d", &num);
        if (num > mayor) mayor = num;
        if (num < menor) menor = num;
    }

    printf("Mayor = %d\n", mayor);
    printf("Menor = %d\n", menor);

    printf("Presiona ENTER para salir...");
    getchar(); getchar(); // pausa
    return 0;
}
