import java.util.Scanner;

public class Busqueda {
    public static int busquedaLineal(int[] a, int x) {
        for (int i = 0; i < a.length; i++) {
            if (a[i] == x) return i;
        }
        return -1;
    }

    public static void ordenarBurbuja(int[] a) {
        int n = a.length;
        for (int i = 0; i < n-1; i++) {
            for (int j = 0; j < n-i-1; j++) {
                if (a[j] > a[j+1]) {
                    int tmp = a[j];
                    a[j] = a[j+1];
                    a[j+1] = tmp;
                }
            }
        }
    }

    public static int busquedaBinaria(int[] a, int x) {
        int l = 0, r = a.length - 1;
        while (l <= r) {
            int m = (l + r) / 2;
            if (a[m] == x) return m;
            else if (x < a[m]) r = m - 1;
            else l = m + 1;
        }
        return -1;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Cuantos numeros? ");
        int n = sc.nextInt();

        int[] a = new int[n];
        System.out.println("Introduce los " + n + " numeros:");
        for (int i = 0; i < n; i++)
            a[i] = sc.nextInt();

        System.out.print("Numero a buscar: ");
        int x = sc.nextInt();

        int pos = busquedaLineal(a, x);
        if (pos != -1)
            System.out.println("Lineal: encontrado en la posicion " + (pos+1));
        else
            System.out.println("Lineal: no encontrado");

        ordenarBurbuja(a);
        pos = busquedaBinaria(a, x);
        if (pos != -1)
            System.out.println("Binaria: encontrado en la posicion (ordenado) " + (pos+1));
        else
            System.out.println("Binaria: no encontrado");

        System.out.println("Presiona ENTER para salir...");
        try {
            System.in.read();
        } catch (Exception e) {}
    }
}
