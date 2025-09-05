#include <stdio.h>
#include <stdlib.h>

typedef struct Nodo {
    int key;
    struct Nodo* izq;
    struct Nodo* der;
} Nodo;

Nodo* nuevo(int x) {
    Nodo* n = (Nodo*)malloc(sizeof(Nodo));
    n->key = x; n->izq = n->der = NULL;
    return n;
}

Nodo* insertar(Nodo* r, int x) {
    if (r == NULL) return nuevo(x);
    if (x < r->key) r->izq = insertar(r->izq, x);
    else if (x > r->key) r->der = insertar(r->der, x);
    /* duplicado: ignorar */
    return r;
}

void preorden(Nodo* r) {
    if (!r) return;
    printf("%d ", r->key);
    preorden(r->izq);
    preorden(r->der);
}

void inorden(Nodo* r) {
    if (!r) return;
    inorden(r->izq);
    printf("%d ", r->key);
    inorden(r->der);
}

void postorden(Nodo* r) {
    if (!r) return;
    postorden(r->izq);
    postorden(r->der);
    printf("%d ", r->key);
}

int main() {
    int n, i, x;
    Nodo* raiz = NULL;

    printf("Cuantos numeros insertar? ");
    scanf("%d", &n);
    printf("Introduce %d numeros:\n", n);
    for (i = 0; i < n; i++) {
        scanf("%d", &x);
        raiz = insertar(raiz, x);
    }

    printf("Preorden:\n");  preorden(raiz);  printf("\n");
    printf("Inorden:\n");   inorden(raiz);   printf("\n");
    printf("Postorden:\n"); postorden(raiz); printf("\n");

    printf("Presiona ENTER para salir...");
    getchar(); getchar();
    return 0;
}
