//Crea un programa que contenga una constante llamada gravedad=9,8, solicite al usuario el valor de "tiempo", y calcule
// y muestre la velocidad (velocidad=gravedad x tiempo). Nota: si el valor del tiempo es negativo o 0, se mostrará el
// mensaje "Tiempo incorrecto"
import java.util.Scanner;
public class Ejercicio56 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        double gravedad = 9.8;
        double numero1;

        System.out.println("Dime el tiempo y te mostraré la velocidad");
        numero1 = teclado.nextDouble();
        if (numero1 > 0)
        System.out.println(gravedad*numero1);
        else
            System.out.println("No puede ser negativo o 0");
    }
}
