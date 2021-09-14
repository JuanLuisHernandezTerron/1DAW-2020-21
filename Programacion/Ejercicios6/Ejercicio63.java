//Crea un programa que pida un número entero al usuario y dé a una variable par el valor 1 si ese número es par o el
// valor 0 si no es par. Hazlo primero con un "if" y luego con un "operador condicional".

import java.util.Scanner;
public class Ejercicio63 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);
        int numero;

        System.out.println("Dime un numero");
        numero = teclado.nextInt();

        if (numero % 2 == 0) {
            int par = 1;
            System.out.println(par+" Es par");
        } else {
            int par = 0;
            System.out.println(par + " Es impar");
        }
    }
}
