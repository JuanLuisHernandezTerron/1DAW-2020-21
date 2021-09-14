//Crea un programa que pida al usuario el número de un mes y escriba el nombre de ese mes. Por ejemplo, si el usuario
// introduce 9, deberá escribir "septiembre".
import java.util.Scanner;

public class Ejercicio61 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        int mes=12;

        System.out.println("Dime un numero y te digo el mes");
        mes = teclado.nextInt();

    switch (mes){
        case 1: System.out.println("Enero"); break;
        case 2: System.out.println("Febrero"); break;
        case 3: System.out.println("Marzo"); break;
        case 4: System.out.println("Abril"); break;
        case 5: System.out.println("Mayo"); break;
        case 6: System.out.println("Junio"); break;
        case 7: System.out.println("Julio"); break;
        case 8: System.out.println("Agosto"); break;
        case 9: System.out.println("Septiembre"); break;
        case 10: System.out.println("Octubre"); break;
        case 11: System.out.println("Noviembre"); break;
        case 12: System.out.println("Diciembre"); break;
        }
    }
}
