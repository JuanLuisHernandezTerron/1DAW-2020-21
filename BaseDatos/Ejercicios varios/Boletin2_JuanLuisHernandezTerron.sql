/*Ejercicio1: Mostrar todos los datos de todas las personas.*/

SELECT * FROM personas

/*Ejercicio2: Obtén el DNI, apellidos y función de todas las personas*/

SELECT dni,apellidos,funcion FROM personas

/*Ejercicio3: Mostrar los apellidos de las personas que vivan en LORCA.*/

SELECT apellidos,localidad FROM personas
WHERE localidad='LORCA'

/*Ejercicio4: Mostrar los apellidos de las personas que vivan en MURCIA o LORCA.*/

SELECT apellidos,localidad FROM personas
WHERE localidad='MURCIA' OR 'LORCA'

/*Ejercicio5: Seleccionar los datos de aquellas personas que vivan en MURCIA y tengan un salario superior a los 1500 euros.*/

SELECT apellidos,localidad,salario FROM personas
WHERE localidad='MURCIA' AND salario>1500 

/*Ejercicio6: Mostrar los datos de las personas que vivan en MURCIA, tengan un salario superior a los 1500 euros y sean DIRECTORES.*/

SELECT * FROM personas
WHERE localidad='MURCIA' AND  salario>1500 AND funcion='DIRECTORES'

/*Ejercicio7: Mostrar los datos de las personas cuya función sea MÉDICO ordenados por apellidos descendentemente.*/

SELECT * FROM personas

WHERE funcion='Médico' ORDER BY apellidos DESC 


/*Ejercicio8: Mostrar los datos de todas las localidades que hay en la tabla personas sin repeticiones (debes empear la cláusula DISTINCT)*/

SELECT DISTINCT localidad FROM personas

/*Ejercicio9: Mostrar los datos de las personas que tengan un salario superior a 1500 euros y sean médicos. Ordenar la salida por salario descendentemente.*/

SELECT * FROM personas

WHERE salario>1500 AND funcion='Médico' ORDER BY salario DESC 

/*Ejercicio10: Seleccionar aquellas personas cuyo apellido comience por M.*/

SELECT * FROM personas

WHERE apellidos LIKE 'M%'

/*Ejercicio11: Mostrar los datos de las personas que tengan una M en el apellido y cuya función sea CONSERJE.*/

SELECT * FROM personas

WHERE apellidos LIKE '%M%' AND funcion='CONSERJE'

/*Ejercicio12: Mostrar aquellas personas que tengan un salario entre 1500 y 200 euros*/

SELECT * FROM personas

WHERE salario BETWEEN 200 AND 1500

/*Ejercicio13: Seleccionar los datos de aquellas personas cuya función sea MÉDICO o DIRECTOR (utilizar el operador IN)*/

SELECT * FROM personas

WHERE funcion IN ('MÉDICO' , 'DIRECTOR')  

/*Ejercicio14: Obtener los datos de aquellas personas cuya función no sea CONSERJE (utilizar el operador NOT IN) y tengan un salario superior a los 1500 euros, ordenados por apellido descendentemente.*/

SELECT * FROM personas

WHERE funcion NOT IN ('conserje') AND salario > 1500 ORDER BY apellidos DESC 


/*Ejercicio15: Mostrar los datos de las personas que sean de MURCIA o CARTAGENA y que pertenezcan al hospital número 1.*/

SELECT * FROM personas

WHERE (localidad='Murcia' OR 'Cartagena') AND cod_hospital=1

/*Ejercicio16: Obtén los apellidos en mayúsculas de las personas que trabajen en el hospital número 1.*/

Select upper(apellidos)from personas 
where cod_hospital=1;


/*Ejercicio17: Con una consulta devuelve los apellidos de todas las personas. Al lado debe aparecer la longitud de cada apellido.*/

Select apellidos, length(apellidos)from personas;

/*Ejercicio18: Obtener los apellidos y localidad en minúscula de todas aquellas personas que no trabajen en el hospital número 1.*/

select Apellidos,lower(localidad) from personas 
WHERE cod_hospital not in (1);

/*Ejercicio19: Obtener los datos de las personas que trabajen en los hospitales 1 ó 2 y tengan un salario superior a 1500 euros.*/

select * from personas 
where cod_hospital in (1,2) and salario>1500;

/*Ejercicio20: Visualizar los datos de aquellas personas que no trabajen en el hospital número 2 y que sean de MURCIA.*/

select * from personas 
where cod_hospital not in (2) and localidad='Murcia';