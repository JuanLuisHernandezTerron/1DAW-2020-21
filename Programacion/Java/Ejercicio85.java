//Desarrollar un programa que solicite los valores mínimo y máximo de un rango. A continuación, solicitará por
// teclado un valor que debe estar dentro del rango. Si no es asi, volverá a solicitar un número, y así repetidas veces
// hasta que el valor esté dentro del rango.
import java.util.Scanner;
public class Ejercicio85 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        System.out.println("Introduzca el valor minimo");
        int valor_minimo = teclado.nextInt();

        System.out.println("Introduzca el valor máximo");
        int valor_maximo = teclado.nextInt();

        System.out.println("Valor dentro del rango");
        int valor_exacto = teclado.nextInt();

        while (valor_exacto <= valor_minimo || valor_exacto >= valor_maximo) {

            if (valor_exacto >= valor_maximo && valor_exacto <= valor_maximo){
                System.out.println(valor_exacto + "esta dentro del rango");
            }else{
                System.out.println(valor_exacto+" Numero fuera del rango");
                valor_exacto= teclado.nextInt();
            }
            System.out.println("Final del programa");
        }
    }
}
