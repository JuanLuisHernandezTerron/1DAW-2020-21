//Un centro educativo nos ha pedido que diseñemos una aplicación para calcular datos estadísticos de los alumnos.
// Se introducirán las edades de los alumnos hasta que una de ellas sea negativa. La aplicación mostrará la suma de
// las edades, la media de cuántos alumnos hemos introducido su edad, y cuántos alumnos son mayores de edad.
import java.util.Scanner;
public class Ejercicio82 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int edad = 0;
        int contador = 0;
        int suma = 0;
        int mayor_edad = 0;

        while (edad >=0) {
            System.out.println("Dime una edad");
            edad = teclado.nextInt();

            if (edad >= 18) {
                mayor_edad++;
            }
            if (edad>=0){
                contador++;
                suma+=edad;
            }
        }
        System.out.println("El numero de alumnos introducido es de "+contador);
        System.out.println("La suma de las edades es: "+suma);
        System.out.println("La media de las edades es: " + suma/(double) contador);
        System.out.println("Hay " + mayor_edad + " mayores de edad");
    }
}
