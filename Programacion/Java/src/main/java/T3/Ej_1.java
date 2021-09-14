package T3;
//Diseñar una función eco() a la que se le pasa como parámetro un número n, y muestra por pantalla n veces el mensaje
// "Eco..."
import java.util.Scanner;
class Ejercicio1 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int n;
        System.out.println("Introduce un numero");
        n =teclado.nextInt();
        eco(n);
    }
    public static void eco(int n){
        for(int i=1;i<=n;i++)
            System.out.println("eco");
    }

}