//Un centro de investigación de la flora urbana necesita una aplicación que muestre cual es el árbol más alto.
// Para ello se introducirán por teclado las alturas en cms de cada árbol, terminando cuando se introduzca -1.
// Los árboles se identifican mediante etiquetas con números correlativos, comenzando en 0.
import java.util.Scanner;
public class Ejercicio89 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        System.out.println("Dime la altura del arbol");
        int altura = teclado.nextInt();
        int altura_max = 0;

        while (altura > 0) {

            if (altura > altura_max) {
                altura_max = altura;
            } altura = teclado.nextInt();

        }
        System.out.println("El arbol mas alto es "+altura_max);
    }
}
