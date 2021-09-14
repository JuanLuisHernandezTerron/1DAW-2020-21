package T3;
//Diseñar una  función a la que se le pasen dos enteros y muestre todos los números comprendidos entre ellos.
import java.util.Scanner;
public class Ej_2 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        System.out.println("Dime un el primer numero entero");
         int numero1 = teclado.nextInt();

        System.out.println("Dime el segundo numero entero");
         int numero2= teclado.nextInt();

        entero(numero1, numero2);

    }
    public static void entero(int numero1, int numero2){

        for (int i = numero1; i <=numero2 ; i++) {
            System.out.println(i);
        }
    }
}
