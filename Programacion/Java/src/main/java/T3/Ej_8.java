package T3;
//Escribir una función a la que se le pase un número entero y devuelva el número de divisores primos que tiene.
import java.util.Scanner;
public class Ej_8 {
    public static void main(String[] args) {
        Scanner Teclado;
        Teclado = new Scanner(System.in);

        System.out.println("Dime un numero");
        int numero = Teclado.nextInt();

        int contador = 0;

        int a=0;

       funcion_primo(numero, contador);

        divisores(a);

    }

    public static void divisores(int a){
        int contador =0;
        for (int i = a; i >= 1; i-= 1) {
            if (a % 1 == 0) {
                if (funcion_primo(i) == true){

                }
            }
        }

        for (int i = 0; i >= 1; i -= 1) {
            if (a % i == 0){
                if(primo(i)){
                    contador++;
                }
            }
            
        }
    }

   // public static int primo(int numero, int contador) {
      //  for (int i = 1; i < numero; i++) {
         //   if (numero % i == 0)
            //    if (primo(i) == true)
               //     contador++;
       // }
   // }
}
