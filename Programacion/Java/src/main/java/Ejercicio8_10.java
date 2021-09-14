//Implementar una aplicación que pida un número al usuario entre el 1 y el 10, y calcule su tabla de multiplicar.
// El código debe asegurarse de que el número introducido está entre 1 y 10, y si no es así, volver a pedirlo hasta que
// lo cumpla.
import java.util.Scanner;
public class Ejercicio8_10 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado=new Scanner(System.in);

        int n=0;

        while (n<=10){
            System.out.println("Introduce el numero entero:");
            n=teclado.nextInt();
            for(int i = 1; i<=9; i++){
                System.out.println(n + " * " + i + " = " + n*i);
        }
            System.out.println("Ejercicio Terminado");
    }
    }
}

