//Un centro de investigación de la flora urbana necesita una aplicación que muestre cual es el árbol más alto.
// Para ello se introducirán por teclado las alturas en cms de cada árbol, terminando cuando se introduzca -1.
// Los árboles se identifican mediante etiquetas con números correlativos, comenzando en 0.
import java.util.Scanner;
public class Ejercicio89 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        double altura;

        System.out.println("Dime las alturas de los arboles en cm");
        altura=teclado.nextDouble();


        while (altura!=-1) {

            System.out.println("Dime las alturas de los arboles en cm");
            altura = teclado.nextDouble();

        }
        System.out.println("El arbol mayor es: ");
        System.out.println("Finaliza el programa");
    }
}
