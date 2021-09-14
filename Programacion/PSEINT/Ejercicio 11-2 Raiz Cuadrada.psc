Algoritmo sin_titulo
	Definir numero1,numero2 Como Real
	Repetir
		Escribir "Dime el numero que quieras saber la raiz cuadrada"
		Leer Numero1;
		numero2 <- rc(Numero1)
		Si numero1<0 Entonces
			Escribir "No puedes agregar un numero negativo"
		FinSi
	Hasta Que numero1=0
	    Escribir "La raiz cuadrada de " numero1 " es " numero2;
FinAlgoritmo
