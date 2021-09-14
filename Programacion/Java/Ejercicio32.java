//Crea un programa que pida al usuario su año de nacimiento
// y el año actual (usando datos de tipo short)
// y halle la diferencia de ambos para obtener su edad.
import java.util.Scanner;

public class Ejercicio32 {
  public static void main(String[] args) {
      Scanner teclado;
    teclado = new Scanner(System.in);
      short numero;
      short numero1;

    System.out.println("Dime la fecha actual");
    numero=teclado.nextShort();
    System.out.println("Dime la fecha de tu cumpleaños");
    numero1=teclado.nextShort();

    System.out.println("La diferencia es de:");
    System.out.print( numero - numero1);
    System.out.print("años");
  }
}
