//Crea un programa que calcule y muestre la suma de dos
// números de dos cifras (de tipo byte) que introduzca el usuario.
import java.util.Scanner;

public class Ejercicio31 {
  public static void main(String[] args) {
      Scanner teclado;
    teclado = new Scanner(System.in);
    byte numero;
    byte numero2;

      System.out.println("Dime un numero");
      numero=teclado.nextByte();
      System.out.println("Dime otro numero");
      numero2=teclado.nextByte();

      System.out.println("La suma de los dos numeros es:");
      System.out.println(numero + numero2);
  }
}
