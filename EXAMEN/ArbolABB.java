import java.util.Scanner;

class Nodo {
    int key;
    Nodo izq, der;
    Nodo(int k) { key = k; }
}

public class ArbolABB {
    static Nodo insertar(Nodo r, int x) {
        if (r == null) return new Nodo(x);
        if (x < r.key) r.izq = insertar(r.izq, x);
        else if (x > r.key) r.der = insertar(r.der, x);
        // duplicado: ignorar
        return r;
    }

    static void preorden(Nodo r) {
        if (r == null) return;
        System.out.print(r.key + " ");
        preorden(r.izq); preorden(r.der);
    }

    static void inorden(Nodo r) {
        if (r == null) return;
        inorden(r.izq);
        System.out.print(r.key + " ");
        inorden(r.der);
    }

    static void postorden(Nodo r) {
        if (r == null) return;
        postorden(r.izq); postorden(r.der);
        System.out.print(r.key + " ");
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Nodo raiz = null;

        System.out.print("Cuantos numeros insertar? ");
        int n = sc.nextInt();
        System.out.println("Introduce " + n + " numeros:");
        for (int i = 0; i < n; i++) {
            int x = sc.nextInt();
            raiz = insertar(raiz, x);
        }

        System.out.println("Preorden:");
        preorden(raiz); System.out.println();
        System.out.println("Inorden:");
        inorden(raiz); System.out.println();
        System.out.println("Postorden:");
        postorden(raiz); System.out.println();

        System.out.println("Presiona ENTER para salir...");
        try { System.in.read(); } catch (Exception e) {}
    }
}
