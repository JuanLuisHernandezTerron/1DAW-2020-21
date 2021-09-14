//Se nos pide hacer un programa que pida la usuario el valor del radio de una circunferencia, y a
// continuación muestre un pequeño menú con 3 opciones:
//
//1.Calcular diámetro
//
//2.Calcular perímetro
//
//3.Calcular área
//
//Dependiendo del número que marque el usuario, deberemos mostrar el resultado correspondiente.
// (diametro=2 x radio) (perímetro=2 x pi x radio) (area=pi x radio x radio)

import java.util.Scanner;
public class Ejercicio65 {
    public static void main(String[] args) {
        Scanner teclado;
        teclado=new Scanner(System.in);
        boolean salir=false;
        int numero1; //Guardamos la opcion del usuario
        int numero2;

        System.out.println("Dime el valor del radio de una circunferencia");
        numero2=teclado.nextInt();

        System.out.println("Elige una opcion:");
        System.out.println("1.Calcular diametro");
        System.out.println("2.Calcular perímetro");
        System.out.println("3.Calcular área");

        System.out.println("Escribe una opción");
        numero1=teclado.nextInt();

        switch (numero1){
            case 1: System.out.println(2*numero2); break;
            case 2: System.out.println(2*3.14*numero2); break;
            case 3: System.out.println(3.14*numero2*numero2); break;
        }
    }
}
