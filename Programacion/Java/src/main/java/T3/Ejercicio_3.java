package T3;
// Realizar una función que calcule y muestre el área o el volumen de un cilindro, según se especifique.
// Para distinguir un caso de otro se le pasará un número 1 (para área) o 2 (para volumen). Además,
// hemos de pasarle a la función el radio de la base y la altura.

import java.util.Scanner;
public class Ejercicio_3 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);


        System.out.println("Dime 1 o 2: 1. Area Total || 2.Volumen");
        int decision=teclado.nextInt();

        System.out.println("Dime la altura");
        int altura= teclado.nextInt();


        System.out.println("Dime el radio");
        int radio= teclado.nextInt();

        x(decision,altura,radio);
    }

    public static void x(int decision,int altura, int radio){

        if(decision==1)
            System.out.println("Este es el area total: "+2*3.14*radio*(altura+radio));
        if (decision==2)
            System.out.println("Este es el volumen total "+3.14*radio*radio*altura);
    }
}
