//Realiza un programa que dadas dos variables a y b, intercambie los valores de a y b.
import java.util.Scanner;

public class Ejercicio71 {

    public static void main(String[] args) {
    Scanner teclado;
    teclado=new Scanner(System.in);
    int a;
    int b;
    int c;
    System.out.println("Escribeme el primer valor que sería a: ");
    a =teclado.nextInt();

    System.out.println("Escribeme el segundo valor que sería b: ");
    b =teclado.nextInt();

    c = a;
    a= b;
    b= c;

    System.out.println("El nuevo valor de a es "+a+" y el nuevo valor de b es "+b);
  }
}
