//Crea un programa que pida tres números enteros largos al usuario y diga cuál es el mayor de los tres.
import java.util.Scanner;

public class Ejercicio55 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);
        int numero1;
        int numero2;
        int numero3;

        System.out.println("Dime un numero");
        numero1 = teclado.nextInt();
        System.out.println("Dime el numero");
        numero2 = teclado.nextInt();
        System.out.println("Dime el tercer numero");
        numero3 = teclado.nextInt();

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




