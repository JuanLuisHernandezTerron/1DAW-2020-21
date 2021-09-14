import java.util.Scanner;

public class Ejercicio23 {
    //División de dos numeros que se pidan.

  public static void main(String[] args) {

    Scanner teclado;
    int primernumero, segundonumero;

    teclado = new Scanner(System.in);
    System.out.print("Introduzca el primernumero");
    primernumero = teclado.nextInt();
    System.out.println("Introduce el segundonumero");
    segundonumero = teclado.nextInt();

    System.out.println("La división de los dos numero sería:");
    System.out.println( primernumero / segundonumero);



  }
}
