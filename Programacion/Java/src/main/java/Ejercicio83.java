//Realizar un aplicación que genere un número aleatorio entre 1 y 100. El jugador debe ir probando números tratando
// de acertarlo. El programa debe indicar "mayor" o "menor" según el número secreto sea mayor o menor que el introducido
// por el usuario. El proceso finaliza cuando el usuario acierta o cuando se rinde (introduciendo un -1).
import java.util.Scanner;
public class Ejercicio83 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);
        int numero= teclado.nextInt();

        int numero_aleatorio = (int) Math.round(Math.random() * 100 + 1);
        System.out.println("Este es el numero aleatorio: ");
        System.out.println(numero_aleatorio);

        while (numero_aleatorio!=numero) {
            System.out.println("Dime el numero");
            numero = teclado.nextInt();

            if (numero_aleatorio ==numero){
                System.out.println("Has acertado el numero");
            }
            if (numero_aleatorio < numero){
                System.out.println("El numero introducido es mayor");
            }
            if (numero_aleatorio > numero){
                System.out.println("El numero introducido es menor");
            }
        }
        System.out.println("Has introducido el -1 Has acabado.");
    }
}
