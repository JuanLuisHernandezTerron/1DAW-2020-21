package T3;
import java.util.Scanner;
//Repetir el ejercicio anterior con una versión que calcule el máximo de 3 números.
// Piensa un poco, no hagas el algoritmo de comparación de los 3 números desde cero.
public class Ej_5 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        System.out.println("Dime un numero");
        int numero1 = teclado.nextInt();

        System.out.println("Dime un segundo numero");
        int numero2 = teclado.nextInt();

        System.out.println("Dime el tercer numero");
        int numero3 = teclado.nextInt();

        numeros1(numero1, numero2, numero3);
    }

    public static void numeros1(int numero1, int numero2, int numero3) {
        if (numero1 > numero2) {
            if (numero1 > numero3) {
                System.out.println("El mayor es: " + numero1);
            } else {
                System.out.println("el mayor es: " + numero3);
            }
        } else if (numero2 > numero3) {
            System.out.println("el mayor es: " + numero2);
        } else {
            System.out.println("el mayor es: " + numero3);
        }
    }
}
