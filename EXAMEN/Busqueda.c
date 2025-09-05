#include <stdio.h>

void ordenarBurbuja(int a[], int n) {
    int i, j, tmp;
    for (i = 0; i < n-1; i++) {
        for (j = 0; j < n-i-1; j++) {
            if (a[j] > a[j+1]) {
                tmp = a[j];
                a[j] = a[j+1];
                a[j+1] = tmp;
            }
        }
    }
}

int busquedaLineal(int a[], int n, int x) {
    for (int i = 0; i < n; i++)
        if (a[i] == x)
            return i;
    return -1;
}

int busquedaBinaria(int a[], int n, int x) {
    int l = 0, r = n-1, m;
    while (l <= r) {
        m = (l + r) / 2;
        if (a[m] == x) return m;
        else if (x < a[m]) r = m - 1;
        else l = m + 1;
    }
    return -1;
}

int main() {
    int n, i, x, pos;
    int a[100];

    printf("Cuantos numeros (max 100)? ");
    scanf("%d", &n);

    printf("Introduce los %d numeros:\n", n);
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);

    printf("Numero a buscar: ");
    scanf("%d", &x);

    pos = busquedaLineal(a, n, x);
    if (pos != -1)
        printf("Lineal: encontrado en la posicion %d\n", pos+1);
    else
        printf("Lineal: no encontrado\n");

    ordenarBurbuja(a, n);
    pos = busquedaBinaria(a, n, x);
    if (pos != -1)
        printf("Binaria: encontrado en la posicion (ordenado) %d\n", pos+1);
    else
        printf("Binaria: no encontrado\n");

    printf("Presiona ENTER para salir...");
    getchar(); getchar();
    return 0;
}
