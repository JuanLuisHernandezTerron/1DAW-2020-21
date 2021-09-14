// Escribe un programa que muestre la hora actual.

import java.util.Calendar;

public class Ejercicio45 {
  public static void main(String[] args) {

    Calendar calendario = Calendar.getInstance();

    int hora, minutos, segundos;

    hora = calendario.get(Calendar.HOUR_OF_DAY);
    minutos = calendario.get(Calendar.MINUTE);
    segundos = calendario.get(Calendar.SECOND);

    System.out.println(hora + ":" + minutos + ":" + segundos);
  }
}
