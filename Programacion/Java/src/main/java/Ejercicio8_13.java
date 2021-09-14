//Dadas 6 notas, escribir la cantidad de alumnos aprobados, condicionados (=4) y suspensos.
import java.util.Scanner;
public class Ejercicio8_13 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

       int contador_aprobados=0;
       int contador_condicionado=0;
       int contador_suspensos=0;

        for (int i=1;i<=6;i++){
            System.out.println("Dime las 6 notas de los alumnos");
            int notas=teclado.nextInt();

            if (notas>=5){
                contador_aprobados++;
            }
            if (notas==4){
                contador_condicionado++;
            }
            if (notas<=3){
                contador_suspensos++;
            }
        }
        System.out.println("Hay "+contador_aprobados+" Aprobados");
        System.out.println("Hay "+contador_condicionado+" Condicionados");
        System.out.println("Hay "+contador_suspensos+" Suspensos");
    }
}
