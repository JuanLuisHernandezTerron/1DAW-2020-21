//Crea un programa que pida al usuario que introduzca el número 12.
// Después debe decirle si lo ha hecho correctamente o no.

import java.util.Scanner;
public class Ejercicio52 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int numero1;

        System.out.println("Introduceme el numero 12");
        numero1= teclado.nextInt();

        if (numero1 == 12)
            System.out.println("Esta bien introducido");
        else
            System.out.println("Está mal introducido");
    }
}
