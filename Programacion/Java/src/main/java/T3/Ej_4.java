package T3;
//Diseñar una función que reciba como parámetros dos números enteros y que devuelva el mayor de los dos.

import java.util.Scanner;
public class Ej_4 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        System.out.println("Dime un numero entero");
        int entero1 =teclado.nextInt();

        System.out.println("Dime otro numero entero");
        int entero2 =teclado.nextInt();

        numeros(entero1,entero2);

        System.out.println(numeros(entero1,entero2));
    }
    public static int numeros(int entero1, int entero2){

        // System.out.println(Math.max(entero1,entero2)); ---> Es otra manera de hacerlo.

        if (entero1>=entero2) {
            System.out.println(entero1);
            return entero1;
        }else{
            System.out.println(entero2);
            return entero2;
        }
    }
}
