// Necesitamos una aplicación que calcule la media aritmética de dos notas enteras. Hay que tener en
// cuenta
// que la media puede contener decimales.
import java.util.Scanner;

public class Ejercicio42 {
  public static void main(String[] args) {
    Scanner teclado;
    teclado = new Scanner(System.in);
    double numero1;
    double numero2;

    System.out.println("Dime la primera de las dos notas");
    numero1 = teclado.nextDouble();

    System.out.println("Dime la segunda nota");
    numero2 = teclado.nextDouble();

    System.out.println((numero1 + numero2) / 2);
  }
}
