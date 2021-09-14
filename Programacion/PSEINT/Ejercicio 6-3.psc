Algoritmo sin_titulo
	numero1 <- Azar(101)
	Escribir "", numero1
	numero2 <- Azar(101)
	Escribir "", numero2
	
	numero3 <- numero1 + numero2
	Escribir "Calcula la suma de los numeros aleatorios"
	Leer numero3
	Mientras NO numero1 + numero2 = numero3 Hacer
		suma <- numero1 + numero2 = numero3
		Escribir "Mal"
		Escribir "Vuelva a Intentarlo"
		Leer numero3
	FinMientras
	Escribir "La suma es correcta"
FinAlgoritmo
