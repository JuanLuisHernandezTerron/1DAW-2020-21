//Crea un programa que calcule y
// muestre la división de dos números reales de doble precisión introducidos por el usuario.
import java.util.Scanner;

public class Ejercicio33 {
  public static void main(String[] args) {
    Scanner teclado;
    teclado= new Scanner(System.in);
    double numero1;
    double numero2;

    System.out.println("Dime el primer numero real");
     numero1=teclado.nextDouble();
    System.out.println("Dime el segundo numero real");
    numero2=teclado.nextDouble();

    System.out.println("La resta de los dos numeros reales introducidos son:");
    System.out.println(numero1 - numero2);

  }
}
