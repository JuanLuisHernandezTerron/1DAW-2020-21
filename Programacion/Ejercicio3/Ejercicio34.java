//Crea un programa que pida al usuario una longitud en millas (por ejemplo, 3)
//y calcule su equivalencia en kilómetros, usando datos de tipo float (1 milla = 1.609 km).
import java.util.Scanner;

public class Ejercicio34 {
  public static void main(String[] args) {
    Scanner teclado;
    teclado = new Scanner(System.in);
    float numero1;

    System.out.println("Dime las millas por favor");
    numero1=teclado.nextFloat();
    System.out.println("El resultado en metros es el siguiente:");
    System.out.println(numero1 * 1609);
  }
}
