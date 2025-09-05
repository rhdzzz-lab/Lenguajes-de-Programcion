import java.util.Scanner;

public class Fibonacci {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Introduce el numero de terminos: ");
        int n = sc.nextInt();

        long a = 0, b = 1, c;

        System.out.println("Serie de Fibonacci:");
        if (n >= 1) System.out.print(a + " ");
        if (n >= 2) System.out.print(b + " ");

        for (int i = 3; i <= n; i++) {
            c = a + b;
            System.out.print(c + " ");
            a = b;
            b = c;
        }

        System.out.println();

        System.out.println("Presiona ENTER para salir...");
        try {
            System.in.read();
        } catch (Exception e) {}
    }
}
