//Realizar un programa que nos pida un número n, y nos diga cuantos números hay entre 1 y n que sean primos.
// Un número primo es aquel que sólo es divisible por 1 y por él mismo. Ejemplo: Para n=8:
//
//1-> primo
//
//2->primo
//
//3->primo
//
//4->no primo
//
//5->primo
//
//6->no primo
//
//7->primo
//
//8->no primo
//
//Resultado del programa: Entre 1 y 8 hay 5 números primos.
import java.util.Scanner;
public class Ejercicio8_15 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        System.out.println("Introduzca un numero");
        int n= teclado.nextInt();
        int contador_primos=0;

        for(int num=1;num<=n;num++){
            boolean es_primo = true;
            for (int i=2; i <num; i++){
                if (num % i ==0){
                    es_primo=false;
                    break;
                }
            }
            if (es_primo){
                contador_primos++;
            }
        }
        System.out.println("Entre 1 y "+n+ " hay "+contador_primos+" numeros primos");
    }
}
