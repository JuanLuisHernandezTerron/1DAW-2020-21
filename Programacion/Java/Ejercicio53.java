//Crea un programa que diga si el número introducido por el usuario es impar o no lo es.

import java.util.Scanner;
public class Ejercicio53 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado=new Scanner(System.in);

        int numero1;

        System.out.println("Dime un numero para saber si es par o no");
        numero1= teclado.nextInt();

        if (numero1%2==0)
            System.out.println("Es par");
        else
            System.out.println("Es impar");
    }
}
