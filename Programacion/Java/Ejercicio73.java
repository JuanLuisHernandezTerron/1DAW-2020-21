// Realiza un programa que genere una letra minúscula de forma aleatoria. Investiga el uso de la
// función Math.random()
// . Investiga también sobre el sistema de codificación ASCII y ten en cuenta que las letras
// minúsculas se corresponden
// con los números del 97 al 122.
import java.util.Scanner;

public class Ejercicio73 {
  public static void main(String[] args) {
    Scanner teclado;
    teclado = new Scanner(System.in);

    String palabra = "";
    int caracteres = (int) (Math.random() * 20) + 2;
    for (int i = 0; i < caracteres; i++) {
      int codigoAscii = (int) Math.floor(Math.random() * (122 - 97) + 97);
      palabra = palabra + (char) codigoAscii;
    }
  }
}
