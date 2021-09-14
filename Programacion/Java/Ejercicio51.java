//Crea un programa que pida un número entero al usuario y diga si es positivo (mayor que cero) o si, por el contrario,
// no lo es (usando "else").
import java.util.Scanner;

public class Ejercicio51 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int numero1;

        System.out.println("Dime un numero entero");
        numero1 = teclado.nextInt();
        if (numero1 >= 0)
        {
            System.out.println("Es positivo");
        }
        else{
            System.out.println("Es negativo");
        }
    }
}
