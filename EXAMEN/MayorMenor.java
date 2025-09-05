import java.util.Scanner;

public class MayorMenor {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Cuantos numeros quieres ingresar? ");
        int n = sc.nextInt();

        if (n <= 0) {
            System.out.println("Cantidad invalida.");
            return;
        }

        System.out.print("Introduce el numero 1: ");
        int num = sc.nextInt();
        int mayor = num;
        int menor = num;

        for (int i = 2; i <= n; i++) {
            System.out.print("Introduce el numero " + i + ": ");
            num = sc.nextInt();
            if (num > mayor) mayor = num;
            if (num < menor) menor = num;
        }

        System.out.println("Mayor = " + mayor);
        System.out.println("Menor = " + menor);

        System.out.println("Presiona ENTER para salir...");
        try {
            System.in.read();
        } catch (Exception e) {}
    }
}
