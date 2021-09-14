// Sería interesante disponer de un programa que pida como entrada un número
// decimal y lo muestre redondeando al entero más próximo. ej: 2,3 -> 2      4,8 -> 5
import java.util.Scanner;

public class Ejercicio44 {
  public static void main(String[] args) {
    Scanner teclado;

    teclado = new Scanner(System.in);
    float numero1;

    System.out.println("Dime un numero decimal");
    numero1 = teclado.nextFloat();

    System.out.println(Math.round(numero1));
  }
}
