// Diseñar el juego "Acierta la contraseña". El primer jugador introduce una contraseña, el segundo, debe insertar otra
// intentando acertarla con las pistas que le dará el programa: número de caracteres, primera y última letra.
// El programa debe escribir "Acertaste" o "Fallaste".
import java.util.Scanner;
public class Ejercicio92 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        String contrasena;
        String contrasena_acertada;


        System.out.println("Dime la contraseña, un ejemplo puede ser Hola");
        contrasena = teclado.nextLine();

        String primera_letra = contrasena.substring(0, 1);
        System.out.println("Esta es la primera letra " + primera_letra);

        String ultima_letra = contrasena.substring(3, 4);
        System.out.println("Esta es la ultima letra " + ultima_letra);

        int numero_caracter = contrasena.length();
        System.out.println("El numero de caracter es de: " + numero_caracter);

        System.out.println("Dime la contraseña que crees que es");
        contrasena_acertada = teclado.nextLine();

        System.out.println("Si es True= Has acertado y si es False= Has fallado -> "+contrasena.equals(contrasena_acertada));

    }
}