import java.util.Scanner;

// Crea un programa que pida al usuario una longitud en millas
// (por ejemplo, 3) y calcule su equivalencia en metros
// (1 milla = 1609 m).
public class Ejercicio24 {
  public static void main(String[] args) {
    Scanner teclado;
    int millas;

    teclado = new Scanner(System.in);
    System.out.println("Dime la longitud en millas");
    millas = teclado.nextInt();
    System.out.println("La longitud en metros sería:");
    System.out.println(millas * 1609);
  }
}
