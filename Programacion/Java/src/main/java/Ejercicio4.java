//Escribe un programa que pida un número entero positivo por teclado y que
//muestre a continuación los 5 números consecutivos a partir del número
//introducido (incluyendo él mismo). Al lado de cada número se debe indicar
//si se trata de un primo o no.
import java.util.Scanner;
public class Ejercicio4 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int numero1;
        boolean esprimo=true;

        System.out.println("Dime un numero");
        numero1= teclado.nextInt();

        for (int x = numero1; x < numero1 + 5; x++) {
            System.out.println(x);

            for (int i=2;i<numero1; i++){
                if (numero1%i==0){
                    esprimo=false;
                }
            }
            if (esprimo){
                System.out.println("Es primo");
            }else{
                System.out.println("No es primo");
            }
        }
    }
}