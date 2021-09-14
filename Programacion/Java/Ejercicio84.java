//Escribir una aplicación que pida un número n, y escriba los números desde 1 hasta n.
import java.util.Scanner;
public class Ejercicio84 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int numero;
        int numero1;

        System.out.println("Dime un numero");
        numero1 = teclado.nextInt();

        for (numero=1 ; numero<=numero1 ; numero++) {
            System.out.println(numero);
        }
    }
}
