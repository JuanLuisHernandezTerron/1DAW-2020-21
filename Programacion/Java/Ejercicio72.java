// Tenemos las variables enteras "edad", "nivel_de_estudios", e "ingresos". Necesitamos almacenar en
// la variable booleana "jasp" el valor:
//
//    verdadero. Si la edad es menor o igual a 28, el nivel de estudios es mayor que 3, y los
// ingresos superan los 28000 (euros).
//    falso. En caso contrario.
//
// escribe el código necesario para inicializar "jasp" en una línea.
import java.util.Scanner;

public class Ejercicio72 {
  public static void main(String[] args) {
    Scanner teclado;
    teclado = new Scanner(System.in);

    int edad;
    int nivelestudios;
    int ingresos;

    System.out.println("Dime tu edad por favor");
    edad = teclado.nextInt();

    System.out.println("Dime tu nivel de estudios por favor");
    nivelestudios = teclado.nextInt();

    System.out.println("Dime tus ingresos por favor");
    ingresos = teclado.nextInt();

    boolean jasp = (edad <= 28) && (nivelestudios > 3) && (ingresos > 2800);

    if (jasp) {
      System.out.println(true);
    } else {
      System.out.println(false);
    }
  }
}
