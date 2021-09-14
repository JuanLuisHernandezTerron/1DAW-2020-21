//Escribe un programa que diga cuántos dígitos pares y cuántos dígitos impares
//hay dentro de un número. Se recomienda usar long en lugar de int ya que el
//primero admite números más largos.
import java.util.Scanner;
public class ejercicio2 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        long numeropar=0;
        long numeroimpar=0;
        long numero;

        System.out.println("Introduzca el número");
        numero = teclado.nextLong();

        for (int i = 0; i <= numero; i++) {
            if (numero % 2 != 0) {
                numeroimpar++;
            }else{
                numeropar++;
            }
            numero=numero/10;
        }
        System.out.println("Hay "+numeroimpar+" numero impares y hay "+numeropar+" numeros pares");
    }
}
