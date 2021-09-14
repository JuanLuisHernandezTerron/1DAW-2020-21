package T3;
//Diseñar una función que nos diga si un número es primo.
import java.util.Scanner;
public class Ej_7 {
    public static void main(String[] args) {
        Scanner Teclado;
        Teclado =new Scanner(System.in);
        System.out.println("Dime el numero");
         int numero= Teclado.nextInt();
         int contador = 0;

         par(numero, contador);
    }
    public static void par(int numero, int contador){
        for (int i = 1; i <numero ; i++) {
            if (numero%i ==0)
                contador ++;
        }
        if (contador==2){
        System.out.println("Es primo");
    }else{
            System.out.println("No es primo");
        }
    }
}
