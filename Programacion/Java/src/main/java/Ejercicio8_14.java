import java.util.Scanner;

//Pedir un número n y dibujar un triángulo rectángulo de n elementos de lado, utilizando para ello asteriscos (*).
// Por ejemplo, para n=4:
//
//* * * *
//
//* * *
//
//* *
//
//*
public class Ejercicio8_14 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado = new Scanner(System.in);

        System.out.println("Dime un numero");
        int n = teclado.nextInt();
        for(int j=n; j>0; j--) {
            for(int i=0; i<j; i++) {
                System.out.print( "*" );
            }
            System.out.println();
        }
    }
}
