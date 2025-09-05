import java.math.BigInteger;
import java.util.Scanner;

public class FactorialJava {
    public static BigInteger factorialFor(int n) {
        BigInteger fact = BigInteger.ONE;
        for (int i = 2; i <= n; i++) {
            fact = fact.multiply(BigInteger.valueOf(i));
        }
        return fact;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Introduce un número: ");
        int num = sc.nextInt();

        BigInteger resultado = factorialFor(num);
        System.out.println(num + "! = " + resultado);

        
        System.out.println("\nPresiona ENTER para salir...");
        try {
            System.in.read();
        } catch (java.io.IOException e) {
        
        }
        sc.close();
    }
}
