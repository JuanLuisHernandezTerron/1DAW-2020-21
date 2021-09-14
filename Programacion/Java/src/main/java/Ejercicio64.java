//Crea un programa que pida dos números de tipo byte al usuario
// y cree a una variable "menor", que tenga el valor del menor de esos dos números. Hazlo primero con un "if"
// y luego con un "operador condicional".

import java.util.Scanner;

public class Ejercicio64 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        byte numero1;
        byte numero2;


        System.out.println("Dime un numero");
        numero1 = teclado.nextByte();

        System.out.println("Dime otro numero");
        numero2 = teclado.nextByte();

        if (numero1 > numero2) {
            System.out.println( (int) numero2 + " Es el numero mas pequeño");
        }else{
            System.out.println(numero1 < numero2);
            System.out.println((int) numero1 +" Es el numero mas pequeño");
            }
        }
    }