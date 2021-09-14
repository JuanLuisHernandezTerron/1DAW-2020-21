Algoritmo sin_titulo
	Escribir "Dime un numero"
	Leer numero1
	Escribir "Dime otro numero"
	Leer numero2
	Escribir "Dime otro numero para finalizar"
	Leer numero3
	
	Si numero1 > numero2  Entonces
		Escribir "El " numero1 " es mayor "
	SiNo
		Si numero2 > numero3 Entonces
			Escribir "El " numero2 " es mayor "
		SiNo
			Escribir "El " numero3 " es mayor "
		FinSi
	FinSi
	
FinAlgoritmo
