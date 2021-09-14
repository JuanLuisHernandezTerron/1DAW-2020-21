//Diseñar un programa que muestre el producto de los 10 primeros números impares.
import java.util.Scanner;
public class Ejercicio87 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        long numero = 1;

        for (int i = 1; i <= 20; i += 2) {
            numero=numero*i;
        }
        System.out.println("La suma de producto es de " + numero);
    }
}