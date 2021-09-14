//Diseñar una aplicación que muestre las tablas de multiplicar del 1 al 10.
import java.util.Scanner;
public class Ejercicio8_11 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        for (int i = 1; i <= 10; i++) {
            System.out.println("Tabla de multiplicar del " + i);
            for (int j = 1; j <= 10; j++) {
                System.out.println(i  + " X " + j + " =" + i*j);
            }

        }

    }
}