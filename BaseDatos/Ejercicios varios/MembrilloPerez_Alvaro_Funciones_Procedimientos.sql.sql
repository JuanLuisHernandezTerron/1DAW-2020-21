-- PROCEDIMIENTOS SIN SENTENCIAS SQL

/*1- Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!.*/

delimiter $$

CREATE PROCEDURE holamundo()
	BEGIN
		SELECT '¡Hola Mundo!';
	END $$


/*2. Escribe un procedimiento que reciba un número real de entrada y muestre un mensaje
indicando si el número es positivo, negativo o cero.*/

delimiter $$

CREATE PROCEDURE analizar_numero(num DOUBLE)
	BEGIN
		if (num > 0) then
			SELECT 'positivo';
		ELSEIF (num < 0) then
			SELECT 'negativo';
		ELSE
			SELECT '0';
		END if;
	END $$


/*3- Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor un número
real, y un parámetro de salida, con una cadena de caracteres indicando si el número es positivo, negativo o cero.*/

delimiter $$
CREATE PROCEDURE analizar_numero_texto(IN num DOUBLE, OUT res VARCHAR(15))
	BEGIN
	
		if (num > 0) then
			SET res = 'positivo';
		ELSEIF (num < 0) then
			SET res = 'negativo';
		ELSE
			SET res = 'Cero';
		END if;
	END $$


/*4- Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, y muestre un mensaje
indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:*/

delimiter $$
CREATE PROCEDURE calificacion(nota INT)
	BEGIN
		if ((nota > 0) && (nota < 5)) then
			SELECT 'Insuficiente';
		ELSEIF ((nota > 5) && (nota < 6)) then
			SELECT 'Aprobado';
		ELSEIF ((nota > 6) && (nota < 7)) then
			SELECT 'Bien';
		ELSEIF ((nota > 7) && (nota < 9)) then
			SELECT 'Notable';
		ELSEIF ((nota > 9) && (nota < 10)) then
			SELECT 'Sobresaliente';
		ELSE
			SELECT 'valor incorrecto';
		END if;
	END $$


/*5- Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor de la nota
en formato numérico y un parámetro de salida, con una cadena de texto indicando la nota correspondiente.*/

delimiter $$
CREATE PROCEDURE calificacion_v2(IN nota INT, OUT res VARCHAR(20))
	BEGIN
		if ((nota > 0) && (nota < 5)) then
			SET res = 'Insuficiente';
		ELSEIF ((nota > 5) && (nota < 6)) then
			SET res = 'Aprobado';
		ELSEIF ((nota > 6) && (nota < 7)) then
			SET res = 'Bien';
		ELSEIF ((nota > 7) && (nota < 9)) then
			SET res = 'Notable';
		ELSEIF ((nota > 9) && (nota < 10)) then
			SET res = 'Sobresaliente';
		ELSE
			SET res = 'valor incorrecto';
		END if;
		
		SELECT res;
	END $$


/*6- Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.*/

delimiter $$
CREATE PROCEDURE calificacion_case(IN nota INT, OUT res VARCHAR(20))
	BEGIN
	case
		when ((nota > 0) && (nota < 5)) then
			SET res = 'Insuficiente';
		when ((nota > 5) && (nota < 6)) then
			SET res = 'Aprobado';
		when ((nota > 6) && (nota < 7)) then
			SET res = 'Bien';
		when ((nota > 7) && (nota < 9)) then
			SET res = 'Notable';
		when ((nota > 9) && (nota < 10)) then
			SET res = 'Sobresaliente';
		ELSE
			SET res = 'valor incorrecto';
		
		SELECT res;
	END $$


/*7- Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una
cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.*/

delimiter $$

CREATE PROCEDURE dia_semana(dia INT)
	BEGIN
		DECLARE res VARCHAR(20);
		case dia
		when 1 then
			SET res = 'Lunes';
		when 2 then
			SET res = 'Martes';
		when 3 then
			SET res = 'Miércoles';
		when 4 then
			SET res = 'Jueves';
		when 5 then
			SET res = 'Viernes';
		when 6 then
			SET res = 'Sábado';
		when 7 then
			SET res = 'Domingo';
		END case;
		
		SELECT res;
	END $$



--PROCEDIMIENTOS CON SENTENCIAS SQL
/*1- Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada y realice una consulta sobre la tabla cliente
para obtener todos los clientes que existen en la tabla de ese país.*/

delimiter $$

CREATE PROCEDURE clientes_pais(country VARCHAR(50))
	BEGIN
		SELECT * FROM cliente
		WHERE pais = country;
	END $$

CALL clientes_pais('spain');


/*2- Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres (Ejemplo: PayPal, Transferencia etc). Y devuelva como salida el pago de máximo valor realizado para esa forma de pago. Deberá hacer uso de la tabla pago de la base de datos jardineria.*/

delimiter $$

CREATE PROCEDURE max_metodo_pago(metodo VARCHAR(40))
	BEGIN
		SELECT MAX(total) FROM pago
		WHERE forma_pago = metodo;
	END $$

CALL max_metodo_pago ('paypal');


/*3- Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres
(Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida los siguientes valores teniendo en cuenta la forma de pago
seleccionada como parámetro de entrada:
el pago de máximo valor,
el pago de mínimo valor,
el valor medio de los pagos realizados,
la suma de todos los pagos,
el número de pagos realizados para esa forma de pago.
*/

delimiter $$

CREATE PROCEDURE analisis_forma_pago(metodo_pago VARCHAR(40))
	BEGIN
		SELECT MAX(total), MIN(total), AVG(total), SUM(total), COUNT(total) FROM pago
		WHERE forma_pago = metodo_pago;
	END $$
	
CALL analisis_forma_pago('Paypal')



--FUNCIONES SIN SENTENCIAS SQL

/*1- Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.*/
delimiter $$
CREATE FUNCTION num_par(num int) RETURNS BOOLEAN
BEGIN
	
	if (MOD(num, 2)=0) then
	RETURN TRUE;
	ELSE
	RETURN FALSE;
	END if;
END $$


/*2- Escribe una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.*/

delimiter $$
CREATE FUNCTION hipotenusa(num1 INT, num2 INT) RETURNS DOUBLE
BEGIN
	DECLARE resultado DOUBLE;
	set resultado = SQRT(POW(num1, 2)+POW(num2, 2));
	RETURN resultado;
END $$


/*3- Escribe una función que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de 
caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.*/

delimiter $$

CREATE FUNCTION dia_semana(dia INT) RETURNS VARCHAR(10)
	BEGIN
		DECLARE res VARCHAR(20);
		case dia
		when 1 then
			SET res = 'Lunes';
		when 2 then
			SET res = 'Martes';
		when 3 then
			SET res = 'Miércoles';
		when 4 then
			SET res = 'Jueves';
		when 5 then
			SET res = 'Viernes';
		when 6 then
			SET res = 'Sábado';
		when 7 then
			SET res = 'Domingo';
		END case;
		
		RETURN res;
	END $$



/*4- Escribe una función que reciba tres números reales como parámetros de entrada y devuelva el mayor de los tres.*/

delimiter $$
CREATE FUNCTION mayor(num1 INT, num2 INT, num3 INT) RETURNS INT
BEGIN
	if ((num1 > num2) && (num1 > num3)) then
		RETURN num1;
	ELSEIF ((num2 > num1) && (num2 > num3)) then
		RETURN num2;
	ELSE
		RETURN num3;
	END if;
END $$


/*5- Escribe una función que devuelva el valor del área de un círculo a partir del valor del radio que se recibirá como parámetro de entrada.*/

delimiter $$
CREATE FUNCTION area_ciculo(radio DOUBLE) RETURNS DOUBLE
BEGIN
	RETURN (PI()*POW(radio,2));
END $$


/*6- Escribe una función que devuelva como salida el número de años que han transcurrido entre dos fechas que se reciben como
parámetros de entrada. Por ejemplo, si pasamos como parámetros de entrada las fechas 2018-01-01 y 2008-01-01 la función tiene
que devolver que han pasado 10 años.*/

DELIMITER $$
CREATE FUNCTION calcular_num_años(fecha_final DATE,fecha_inicial DATE) RETURNS DOUBLE
BEGIN 
	DECLARE años DOUBLE;
	SET años = DATEDIFF(fecha_final,fecha_inicial)/365;
	RETURN TRUNCATE(años,0);
END $$

SELECT calcular_num_años('2018-01-01','2008-01-01');



--FUNCIONES CON SENTENCIAS SQL
/*1- Escribe una función para la base de datos tienda que devuelva el número total de productos que hay en la tabla productos.*/
delimiter $$

CREATE FUNCTION num_productos() RETURNS INT
	BEGIN
		DECLARE productos INT;
		SELECT COUNT(*) INTO productos FROM producto;
		
		RETURN productos;
	END $$

SELECT num_productos();


/*2- Escribe una función para la base de datos tienda que devuelva el valor medio del precio de los productos de un determinado fabricante que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.*/
delimiter $$

CREATE FUNCTION media_productos_fabricante(marca VARCHAR(100)) RETURNS DOUBLE
	BEGIN
		DECLARE media DOUBLE DEFAULT 0.0;
		SELECT AVG(precio) INTO media FROM producto p
			INNER JOIN fabricante f
			ON p.codigo_fabricante = f.codigo
			WHERE f.nombre = marca;
			RETURN media;
	END $$
	
	select media_productos_fabricante('asus');


/*3- Escribe una función para la base de datos tienda que devuelva el valor máximo del precio de los productos de un determinado
fabricante que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.*/

delimiter $$

CREATE FUNCTION maximo_productos_fabricante(marca VARCHAR(100)) RETURNS DOUBLE
	BEGIN
		DECLARE maximo DOUBLE DEFAULT 0.0;
		SELECT MAX(precio) INTO maximo FROM producto p
			INNER JOIN fabricante f
			ON p.codigo_fabricante = f.codigo
			WHERE f.nombre = marca;
			RETURN maximo;
	END $$
	
SELECT maximo_productos_fabricante('asus');


/*4- Escribe una función para la base de datos tienda que devuelva el valor mínimo del precio de los productos de un determinado 
fabricante que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.*/

delimiter $$

CREATE FUNCTION minimo_productos_fabricante(marca VARCHAR(100)) RETURNS DOUBLE
	BEGIN
		DECLARE minimo DOUBLE DEFAULT 0.0;
		SELECT MIN(precio) INTO minimo FROM producto p
			INNER JOIN fabricante f
			ON p.codigo_fabricante = f.codigo
			WHERE f.nombre = marca;
			RETURN minimo;performance_schema
	END $$
	
SELECT minimo_productos_fabricante('asus');