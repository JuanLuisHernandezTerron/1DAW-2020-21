package Prueba; // El tipo short permite almacenar valores comprendidos entre -32768 y 32767.
// Realiza un programa que muestre si el rango de valores de un tipo se comporta de forma cíclica.
// Es decir, que muestre el valor máximo de una variable de tipo short, y muestre también qué ocurre
// si sumamos 1 a esa variable.

import java.util.Scanner;

public class Ejercicio41 {
  public static void main(String[] args) {
    Scanner teclado;
    teclado = new Scanner(System.in);
    int numero0 = -32768;
    int numero1 = 32767;
    int numero2 = 32768;
    int numero3 = 32769;

    short numerocorto = (short) numero0;
    short datogrande = (short) numero1;
    short datopasado = (short) numero2;
    short datofallo = (short) numero3;

    System.out.println(datogrande + " Es el valor máximo de una variable tipo short");
    System.out.println(numerocorto + " Este es el valór minimo de una variable tipo short");
    System.out.println("Que pasa si ponemos el 32768 ");
    System.out.println(datopasado);
    System.out.println("Que pasa si ponemos dos numeros más a la variable máxima");
    System.out.println(datofallo);
  }
}
