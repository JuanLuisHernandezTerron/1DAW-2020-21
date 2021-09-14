// Actividad 4.3 - Modificar el ejercicio anterior para que muestre la parte
// entera de la media de tres notas decimales.
import java.util.Scanner;

public class Ejercicio43 {
  public static void main(String[] args) {
    Scanner teclado;

    teclado = new Scanner(System.in);
    float numero1;
    float numero2;
    float numero3;

    System.out.println("Dime la primera de las tres notas");
    numero1 = teclado.nextFloat();

    System.out.println("Dime la segunda nota");
    numero2 = teclado.nextFloat();

    System.out.println("Dime la tercera nota");
    numero3 = teclado.nextFloat();

    System.out.println(Math.round((numero1 + numero2 + numero3) / 3));
  }
}
