//Crea un programa que pida al usuario dos números enteros y cuántos de ellos son pares.

import java.util.Scanner;
public class Ejercicio54 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int numero1;
        int numero2;


        System.out.println("Dime un numero");
        numero1 = teclado.nextInt();
        System.out.println("Dime otro numero");
        numero2 = teclado.nextInt();

        if ((numero1 % 2 == 0) && (numero2 % 2 == 0))
            System.out.println("Los numero son pares");
        else if (((numero1 % 2 == 0) || (numero2 % 2 == 0)))
            System.out.println("Hay un numero impar");
        else {
            System.out.println("No hay ninguno par");

        }
    }
}