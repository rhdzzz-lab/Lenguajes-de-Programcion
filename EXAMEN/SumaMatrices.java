import java.util.Scanner;

public class SumaMatrices {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final int MAX = 10;
        int[][] A = new int[MAX][MAX];
        int[][] B = new int[MAX][MAX];
        int[][] C = new int[MAX][MAX];

        System.out.print("Introduce numero de filas (max 10): ");
        int n = sc.nextInt();
        System.out.print("Introduce numero de columnas (max 10): ");
        int m = sc.nextInt();

        System.out.println("Introduce los elementos de la matriz A:");
        for (int i = 0; i < n; i++)
            for (int j = 0; j < m; j++)
                A[i][j] = sc.nextInt();

        System.out.println("Introduce los elementos de la matriz B:");
        for (int i = 0; i < n; i++)
            for (int j = 0; j < m; j++)
                B[i][j] = sc.nextInt();

        // suma
        for (int i = 0; i < n; i++)
            for (int j = 0; j < m; j++)
                C[i][j] = A[i][j] + B[i][j];

        System.out.println("Resultado (A+B):");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++)
                System.out.printf("%6d", C[i][j]);
            System.out.println();
        }

        System.out.println("Presiona ENTER para salir...");
        try {
            System.in.read();
        } catch (Exception e) {}
    }
}
