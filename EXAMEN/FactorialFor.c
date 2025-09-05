#include <stdio.h>

long long factorialFor(int n) {
    long long f = 1;
    for(int i = 2; i <= n; i++) {
        f *= i;
    }
    return f;
}

int main() {
    int num;
    printf("Introduce un numero: ");
    scanf("%d", &num);

    printf("Factorial: %lld\n", factorialFor(num));
    return 0;
}