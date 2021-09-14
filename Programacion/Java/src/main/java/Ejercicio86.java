// Escribir todos los múltiplos de 7 menores que 100.
import java.util.Scanner;
public class Ejercicio86 {
        public static void main(String[] args) {
            Scanner teclado;
            teclado = new Scanner(System.in);

            int numero1;
            int numero2;
            int numero3;

            System.out.print("Pide el numero 7 por favor");
            numero2 = teclado.nextInt();

            System.out.print("La lista se hará hasta 100, por favor escribe 100");
            numero1 = teclado.nextInt();

            for (numero3=1; numero3 <=numero1; numero3++) {

                if (numero3 % numero2 == 0)
                    System.out.println(numero3);

            }
        }
    }
