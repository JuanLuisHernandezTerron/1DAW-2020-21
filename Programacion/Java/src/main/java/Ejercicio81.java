// Diseñar un programa que muestre, para cada número introducido por teclado, si es par, si es positivo, y su cuadrado.
// El proceso terminará cuando el número introducido por teclado sea 0.
import java.util.Scanner;
public class Ejercicio81 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);
        int numero1;

        System.out.println("Dime un numero");
        numero1=teclado.nextInt();

        int numerocuadrado = numero1 * numero1;

        if (numero1 % 2 ==0){
            System.out.println("Es par");
        }
        else {
            System.out.println("Es impar");
        }

        if (numero1>0){
            System.out.println("Es positivo");
        }else {
            System.out.println("Es negativo");
        }

        System.out.println("El cuadrado del numero es: " +numerocuadrado);

        while (numero1!=0){
            System.out.println("Siguiente Numero: ");
            numero1=teclado.nextInt();
        }
            System.out.println("El programa finaliza");
    }
}