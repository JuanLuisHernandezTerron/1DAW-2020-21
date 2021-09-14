/*Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS get_hola $$
CREATE PROCEDURE get_hola()
BEGIN
	SELECT('Hola MUNDO');
END
$$

CALL get_hola();

/*Escribe un procedimiento que reciba un número real de entrada y muestre un mensaje indicando si el número es positivo, negativo o cero.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS get_numero $$
CREATE PROCEDURE get_numero(num INT)
BEGIN
	IF (num < 0) THEN
		SELECT('Numero Negativo');
	ELSEIF (num > 0) THEN
		SELECT('Numero Positivo');
	ELSE
		SELECT('Es cero');
	END IF;	
END
$$

CALL get_numero(5);

/*Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, con el valor un número real, 
y un parámetro de salida, con una cadena de caracteres indicando si el número es positivo, negativo o cero.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS get_num_real $$
CREATE PROCEDURE get_num_real(num DOUBLE)
BEGIN
	DECLARE tipo_num VARCHAR(15);
	IF (num < 0) THEN
		SET tipo_num=('Numero Negativo');
	ELSEIF (num > 0) THEN
		SET tipo_num=('Numero Positivo');
	ELSE
		SET tipo_num=('Es cero');
	END IF;
	SELECT tipo_num;	
END
$$

CALL get_num_real(5.23);

/*Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, 
y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:
[0,5) = Insuficiente
[5,6) = Aprobado
[6, 7) = Bien
[7, 9) = Notable
[9, 10] = Sobresaliente
En cualquier otro caso la nota no será válida.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS get_nota $$
CREATE PROCEDURE get_nota (num DOUBLE)
BEGIN
	IF (num >= 0 AND num < 5) THEN
		SELECT('Insuficiente');
	ELSEIF (num >=5 AND num <6) THEN
		SELECT('Aprobado');
	ELSEIF (num >=6 AND num <7) THEN
		SELECT('Bien');
	ELSEIF (num >=7 AND num <9) THEN
		SELECT('Notable');
	ELSEIF (num >=9 AND num <10) THEN
		SELECT('Sobresaliente');
	ELSE
		SELECT('No es valido');
	END IF;
END
$$

CALL get_nota(7);

/*Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS get_nota $$
CREATE PROCEDURE get_nota (nota INT)
BEGIN
	DECLARE resultado VARCHAR(25);
	CASE nota
		WHEN 1 THEN SET resultado='INSU';
		WHEN 2 THEN SET resultado='INSU';
		WHEN 3 THEN SET resultado='INSU';
		WHEN 4 THEN SET resultado='INSU';
		WHEN 5 THEN SET resultado='SUFI';
		WHEN 6 THEN SET resultado='BIEN';
		WHEN 7 THEN SET resultado='NOTA';
		WHEN 8 THEN SET resultado='NOTA';
		WHEN 9 THEN SET resultado='SOBRE';
		WHEN 10 THEN SET resultado='SOBRE';	
	ELSE 
		SET resultado=('NO ES VALIDO');	
	END CASE;
	SELECT resultado;
END
$$

CALL get_nota(7);

/*Escribe un procedimiento que reciba el nombre de un país como parámetro de 
entrada y realice una consulta sobre la tabla cliente para obtener todos los clientes que existen enclientes la tabla de ese país.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS get_pais $$
CREATE PROCEDURE get_pais(nombre_pa VARCHAR(25))
BEGIN
	SELECT * 
	FROM cliente
	WHERE pais=nombre_pa;
END
$$

CALL get_pais('Spain');

/*Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres 
(Ejemplo: PayPal, Transferencia, etc). 
Y devuelva como salida el pago de máximo valor realizado para esa forma de pago. 
Deberá hacer uso de la tabla pago de la base de datos jardineria.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS get_max_valor $$
CREATE PROCEDURE get_max_valor (tipo_pago VARCHAR(20))
BEGIN
	SELECT MAX(total), forma_pago
	FROM pago
	WHERE forma_pago=tipo_pago;
END
$$

CALL get_max_valor('PayPal');

/*Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres 
(Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida los siguientes valores teniendo en cuenta 
la forma de pago seleccionada como parámetro de entrada:
el pago de máximo valor,
el pago de mínimo valor,
el valor medio de los pagos realizados,
la suma de todos los pagos,
el número de pagos realizados para esa forma de pago.
Deberá hacer uso de la tabla pago de la base de datos jardineria.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS get_varios_formas$$
CREATE PROCEDURE get_varios_formas (tipo_pag VARCHAR(20))
BEGIN
	DECLARE maxvalor DOUBLE DEFAULT 0;
	DECLARE minvalor DOUBLE DEFAULT 0;
	DECLARE mediovalor DOUBLE DEFAULT 0;
	DECLARE sumavalor DOUBLE DEFAULT 0;
	
	SELECT MAX(total)
	INTO maxvalor
	FROM pago
	WHERE forma_pago=tipo_pag;
	
	SELECT MIN(total)
	INTO minvalor
	FROM pago
	WHERE forma_pago=tipo_pag;
	
	SELECT AVG(total)
	INTO mediovalor
	FROM pago
	WHERE forma_pago=tipo_pag;
	
	SELECT SUM(total)
	INTO sumavalor
	FROM pago
	WHERE forma_pago=tipo_pag;
	
	SELECT maxvalor, minvalor, mediovalor, sumavalor;
END
$$

CALL get_varios_formas('PayPal');














/*Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.*/

DELIMITER $$
DROP FUNCTION IF EXISTS get_true_false $$
CREATE FUNCTION get_true_false (num INT) RETURNS BOOLEAN
BEGIN
	DECLARE par INT DEFAULT 0;
	IF (num % 2 = 0) THEN
		SET par = 1;
	END IF;
	RETURN par;
END
$$

SELECT get_true_false(2);

/*Escribe una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.*/

DELIMITER $$
DROP FUNCTION IF EXISTS get_hipotenusa $$
CREATE FUNCTION get_hipotenusa (num DOUBLE, num2 DOUBLE) RETURNS DOUBLE
BEGIN
	DECLARE hipotenusa DOUBLE DEFAULT 0;
	
	SET hipotenusa= SQRT (POWER(num,2)+POWER(num2,2));
	
	RETURN hipotenusa;
END
$$

/*Crea una base de datos llamada procedimientos que contenga una tabla llamada cuadrados. 
La tabla cuadrados debe tener dos columnas de tipo INT UNSIGNED, una columna llamada número y otra columna llamada cuadrado.
Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_cuadrados con las siguientes características. 
El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y calculará el valor de los 
cuadrados de los primeros números naturales hasta el valor introducido como parámetro. El valor del números y 
de sus cuadrados deberán ser almacenados en la tabla cuadrados que hemos creado previamente.

Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de la tabla antes de insertar los nuevos valores de 
los cuadrados que va a calcular.

Utilice un bucle WHILE para resolver el procedimiento.*/

DROP DATABASE IF EXISTS proce1;
CREATE DATABASE proce1;
USE proce1;

CREATE TABLE cuadrados(
	numero INT UNSIGNED,
	cuadrado INT UNSIGNED
	);

DELIMITER $$
DROP PROCEDURE IF EXISTS get_calcular_cuadrados $$
CREATE PROCEDURE get_calcular_cuadrados (tope INT UNSIGNED)
BEGIN
	DECLARE contador DOUBLE DEFAULT 1;
	DECLARE cuadrado DOUBLE DEFAULT 0;
	
	DELETE FROM proce1.cuadrados;
	
	WHILE (contador <= tope) DO
	SET cuadrado= (POWER(contador,2));
	INSERT INTO cuadrados (numero, cuadrado)
	VALUES (contador, cuadrado);
	SET contador= contador + 1;
	END WHILE;
END
$$

CALL get_calcular_cuadrados(7);











s