//Introducir por teclado dos palabras e indicar cuál de ellas es la más corta.
import java.util.Scanner;
public class Ejercicio91 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Dime la primera letra");
        String a = sc.nextLine();
        System.out.println("Dime la segunda letra");
        String b = sc.nextLine();
        if (a.compareTo(b) < b.compareTo(a)){
            a.compareTo(b);
            System.out.println( a+ " Es más corta ");
        }else{
            b.compareTo(a);
            System.out.println( b + " es la mas corta " );
        }
    }
}
