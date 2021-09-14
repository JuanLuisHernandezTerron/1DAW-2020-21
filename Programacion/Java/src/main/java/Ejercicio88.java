//Pedir un número y calcular su factorial.
//Ejemplo: Factorial de 5:
//
//5! = 5x4x3x2x1 = 120
import java.util.Scanner;
public class Ejercicio88 {
    public static void main(String[] args) {

        long factorial=1;
        int num;
        Scanner numero = new Scanner(System.in);
        System.out.print("Introduce un número: ");

        num = numero.nextInt();
        for (int i = num; i > 0; i--) {
            factorial = factorial * i;
        }
        System.out.println("El factorial de " + num + " es: " + factorial);
    }
}
