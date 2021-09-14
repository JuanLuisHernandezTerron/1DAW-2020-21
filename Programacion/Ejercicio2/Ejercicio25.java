//Crea un programa que pida al usuario una temperatura en grados centígrados
// y calcule (y muestre) a cuántos grados Fahrenheit equivalen (F = 9*C/5 + 32).
import java.util.Scanner;
public class Ejercicio25{
  public static void main(String[] args) {
    Scanner teclado;
    int centigrados;

    teclado= new Scanner(System.in);
    System.out.println("Dime la temperatura en grados centigrados");

    centigrados=teclado.nextInt();
    System.out.println("Los grados en Fahrenheit serían:");
    System.out.println(9*centigrados / 5 + 32);

  }
}
