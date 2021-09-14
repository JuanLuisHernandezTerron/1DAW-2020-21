//Pedir 5 calificaciones de alumnos. El programa debe decir, al final, si hay algún suspenso o no lo hay. Nota: cuidado,
// si hay 2 suspensos, no debe decirlo dos veces.
import java.util.Scanner;
public class Ejercicio8_12 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int contador=0;

        for (int i=1;i<=5;i++){
            System.out.println("Dime la tus notas");
            int notas= teclado.nextInt();

            if (notas<=5){
                contador++;
            }
        }
        System.out.println("Hay "+contador+" Suspensos");
    }
}
