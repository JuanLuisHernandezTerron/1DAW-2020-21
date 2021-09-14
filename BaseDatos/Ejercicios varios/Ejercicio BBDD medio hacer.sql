/*Crea una base de datos llamada procedimientos que contenga una tabla llamada cuadrados. 
La tabla cuadrados debe tener dos columnas de tipo INT UNSIGNED, una columna llamada número y otra columna llamada cuadrado.
Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_cuadrados con las 
siguientes características. El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y 
calculará el valor de los cuadrados de los primeros números naturales hasta el valor introducido como parámetro. 
El valor del números y de sus cuadrados deberán ser almacenados en la tabla cuadrados que hemos creado previamente.

Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de la tabla antes de insertar los nuevos valores de los cuadrados que va a calcular.

Utilice un bucle WHILE para resolver el procedimiento.*/

DROP DATABASE IF EXISTS procedimientos;
CREATE DATABASE procedimientos;
USE procedimientos;

CREATE TABLE cuadrados(
numero INT UNSIGNED,
cuadrado INT UNSIGNED
);

CREATE TABLE ejercicio(
numero INT UNSIGNED
);



DELIMITER $$
DROP PROCEDURE IF EXISTS get_calcular_cuadrados $$
CREATE PROCEDURE get_calcular_cuadrados (tope INT UNSIGNED)

BEGIN
	DECLARE num INT DEFAULT 1;
	DELETE FROM procedimientos.cuadrados 
	WHERE cuadrados.numero >= 0;
	WHILE num <= tope  DO
		INSERT INTO cuadrados(numero,cuadrado) 
		VALUES (num,POWER(num,2));
		SET num=num+1;
	END WHILE;
END
$$

CALL get_calcular_cuadrados(9);

/*Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS get_calcular_cuadrados2 $$
CREATE PROCEDURE get_calcular_cuadrados2 (tope INT UNSIGNED)

	BEGIN
		DECLARE numero INT DEFAULT 1;
			DELETE FROM procedimientos.cuadrados;
		REPEAT
			INSERT INTO cuadrados(numero,cuadrado) 
			VALUES (numero,POWER(numero,2));
			SET numero=numero+1;
		UNTIL numero > tope
		END REPEAT;
	END
$$

CALL get_calcular_cuadrados2(3);

/*Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.*/

DELIMITER $$
USE
DROP PROCEDURE IF EXISTS calcular_cuadrados3 $$
CREATE PROCEDURE calcular_cuadrados3 (tope INT UNSIGNED)
    BEGIN
    DELETE FROM procedimientos.cuadrados;
    DECLARE num INT DEFAULT 1;
    LABEL1: LOOP 
    	INSERT INTO cuadrados(numero,cuadrado)
		VALUES (numero,POWER(numero,2)); 
        SET num=num+1;
        IF num <= tope THEN
        ITERATE LABEL1;
        END IF;
        LEAVE LABEL1;
        END LOOP;
END
$$

CALL get_calcular_cuadrados3(5);

/*Crea una base de datos llamada procedimientos que contenga una tabla llamada ejercicio. 
La tabla debe tener una única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_números con las siguientes características. 
El procedimiento recibe un parámetro de entrada llamado valor_inicial de tipo INT UNSIGNED y deberá almacenar en la tabla ejercicio 
toda la secuencia de números desde el valor inicial pasado como entrada hasta el 1.*/

USE procedimientos;

DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_numeros $$
CREATE PROCEDURE calcular_numeros (valor_inicial INT UNSIGNED)
BEGIN
	DECLARE numero INT DEFAULT 1;
	DELETE FROM procedimientos.ejercicio;
	WHILE numero <= valor_inicial  DO
		INSERT INTO procedimientos.ejercicio 
		VALUES(valor_inicial);
		SET valor_inicial=valor_inicial-1;
	END WHILE;
END
$$

CALL calcular_numeros(5);

/*Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.*/
USE procedimientos;

DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_numeros2 $$
CREATE PROCEDURE calcular_numeros2 (valor_inicial INT UNSIGNED)
BEGIN
	DELETE FROM procedimientos.ejercicio;
	REPEAT
		INSERT INTO procedimientos.ejercicio (numero)
		VALUES (valor_inicial);
		SET valor_inicial = valor_inicial-1;
	UNTIL valor_inicial < 1
	END REPEAT;
END
$$

CALL calcular_numeros2(2);

/*Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.*/
USE procedimientos;
DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_numeros2 $$
CREATE PROCEDURE calcular_numeros2 (valor_inicial INT UNSIGNED)
BEGIN
	DECLARE numero INT DEFAULT 1;
	DELETE FROM procedimientos.cuadrados;
  	 LABEL1: LOOP 
  	 INSERT INTO procedimientos.cuadrados (numero, cuadrado)
  	 VALUES (numero, POWER(numero,2));
      SET numero=numero+1;
      IF numero <= valor_inicial THEN
      ITERATE LABEL1;
      END IF;
      LEAVE LABEL1;
      END LOOP;
END
$$

/*Crea una base de datos llamada procedimientos que contenga una tabla llamada pares y otra tabla llamada impares. 
Las dos tablas deben tener única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
Una vez creada la base de datos y las tablas deberá crear un procedimiento llamado calcular_pares_impares con las siguientes características. 
El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y 
deberá almacenar en la tabla pares aquellos números pares que existan entre el número 1 el valor introducido como parámetro. 
Habrá que realizar la misma operación para almacenar los números impares en la tabla impares.*/

USE procedimientos;

CREATE TABLE pares(
numero INT UNSIGNED	
);

CREATE TABLE impares(
numero INT UNSIGNED
);

USE procedimientos;
DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_pares_impares $$
CREATE PROCEDURE calcular_pares_impares (tope INT UNSIGNED) 
	BEGIN
		DECLARE numero INT DEFAULT 0;
		WHILE numero <= tope DO
		SET numero=numero+1;
		  IF numero % 2 = 0 THEN
			 	INSERT INTO procedimientos.pares (numero)
			 	VALUES (numero);
			ELSE
				INSERT INTO procedimientos.impares (numero)
				VALUES (numero);
			END IF;
		END WHILE;
	END 
$$

CALL calcular_pares_impares(6);

/*Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.*/

USE procedimientos;
DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_pares_impares2 $$
CREATE PROCEDURE calcular_pares_impares2 (tope INT UNSIGNED) 
	BEGIN
		DECLARE numero INT DEFAULT 0;
		DELETE FROM procedimientos.pares;
		DELETE FROM procedimientos.impares;
		REPEAT 
			SET numero=numero+1;
		 	IF numero % 2 = 0 THEN
			 	INSERT INTO procedimientos.pares (numero)
			 	VALUES (numero);
			ELSE
				INSERT INTO procedimientos.impares (numero)
				VALUES (numero);
			END IF;
		UNTIL numero = tope
		END REPEAT;
	END
$$

CALL calcular_pares_impares2(5);

/*Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.*/

USE procedimientos;
DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_pares_impares3 $$
CREATE PROCEDURE calcular_pares_impares3 (tope INT UNSIGNED)
	BEGIN
		DECLARE numero INT DEFAULT 0;
		DELETE FROM procedimientos.pares;
		DELETE FROM procedimientos.impares;
		LABEL1:LOOP
		SET numero=numero+1;
		IF numero % 2 = 0 THEN
			INSERT INTO procedimientos.pares (numero)
			VALUES (numero);
		ELSE
			INSERT INTO procedimientos.impares (numero)
			VALUES (numero);
		END IF;
		IF numero < tope THEN
		ITERATE LABEL1;
		END IF;
		LEAVE LABEL1;
		END LOOP;
	END
$$

CALL calcular_pares_impares3(3);

/*Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.*/

USE procedimientos;
DELIMITER $$
DROP FUNCTION IF EXISTS get_num_ent $$
CREATE FUNCTION get_num_ent (numero INT) RETURNS BOOLEAN
	BEGIN 
	DECLARE par BOOLEAN DEFAULT FALSE;
		IF numero % 2 = 0 THEN
			SET par = TRUE;
		END IF;
	RETURN par;
	END
$$

SELECT get_num_ent(6);

/*Escribe una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.*/

USE procedimientos;
DELIMITER $$
DROP FUNCTION IF EXISTS get_hipo_tri $$
CREATE FUNCTION get_hipo_tri (lado1 DOUBLE, lado2 DOUBLE ) RETURNS DOUBLE
	BEGIN
		DECLARE hipotenusa DOUBLE DEFAULT 0;
		SET hipotenusa = SQRT (POWER(lado1,2) + POWER(lado2,2));
		RETURN hipotenusa;
	END
$$

SELECT get_hipo_tri(5, 3);

/*Escribe una función que reciba como parámetro de entrada un valor numérico que represente un día de la semana y 
que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. 
Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.*/

/*Escribe una función que reciba tres números reales como parámetros de entrada y devuelva el mayor de los tres.*/

USE procedimientos;
DELIMITER $$
DROP FUNCTION IF EXISTS get_mayor_num $$
CREATE FUNCTION get_mayor_num (numero1 DOUBLE, numero2 DOUBLE, numero3 DOUBLE) RETURNS DOUBLE
	BEGIN
		DECLARE num_global DOUBLE DEFAULT 0;
		IF (numero1 > numero2) AND (numero1 > numero3) THEN
		SET num_global=  numero1;
		ELSEIF (numero2 > numero1) AND (numero2 > numero3) THEN
		SET num_global= numero2;
		ELSE 
		SET num_global= numero3;
		END IF;
		RETURN num_global;
	END
$$

SELECT get_mayor_num(2, 5, 1);

/*Escribe una función que devuelva el valor del área de un círculo a partir del valor del radio que se recibirá como parámetro de entrada.*/

USE procedimientos;
DELIMITER $$
DROP FUNCTION IF EXISTS get_area_radio $$
CREATE FUNCTION get_area_radio (radio DOUBLE) RETURNS DOUBLE
	BEGIN
		DECLARE numero DOUBLE DEFAULT 0;
		SET numero= PI() * POWER(radio,2);
		RETURN numero;
	END
$$

SELECT get_area_radio(2.15);

/*Escribe una función que devuelva como salida el número de años que han transcurrido entre dos fechas que se reciben como parámetros de entrada. 
Por ejemplo, si pasamos como parámetros de entrada las fechas 2018-01-01 y 2008-01-01 la función tiene que devolver que han pasado 10 años.
Para realizar esta función puede hacer uso de las siguientes funciones que nos proporciona MySQL:

DATEDIFF
TRUNCATE*/

USE procedimientos;
DELIMITER $$
DROP FUNCTION IF EXISTS get_años_dif $$
CREATE FUNCTION get_años_dif (fech1 DATE, fech2 DATE) RETURNS INT
	BEGIN
		DECLARE años INT DEFAULT 0;
		IF (YEAR(fech1) >= YEAR(fech2)) THEN
			SET años= YEAR(fech1) - YEAR(fech2);
		ELSE 
			SET años= YEAR(fech2) - YEAR(fech1);
		END IF;
		RETURN años;
	END
$$
 
SELECT get_años_dif('2008-01-01', '2018-01-01');

/*Escribe una función que reciba una cadena de entrada y devuelva la misma cadena pero sin acentos. 
La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. 
Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.*/

USE procedimientos;
DELIMITER $$
DROP FUNCTION IF EXISTS get_maria $$
CREATE FUNCTION get_maria (nombre VARCHAR(30)) RETURNS VARCHAR(30)
	BEGIN
		DECLARE acentos VARCHAR(30);
		SET acentos = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nombre, 'á', 'a'), 'é','e'), 'í', 'i'), 'ó', 'o'), 'ú','u');
		RETURN acentos;
	END
$$

SELECT get_maria('Holáááááá');

/*Escribe una función para la base de datos tienda que devuelva el número total de productos que hay en la tabla productos.*/

/*Escribe una función para la base de datos tienda que devuelva el valor medio del precio de los productos de un determinado 
fabricante que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.*/

/*Escribe una función para la base de datos tienda que devuelva el valor máximo del precio de los productos de un determinado 
fabricante que se recibirá como parámetro de entrada. 
El parámetro de entrada será el nombre del fabricante.*/

USE tienda;
DELIMITER $$
DROP FUNCTION IF EXISTS get_max_valor $$
CREATE FUNCTION get_max_valor (nombre_fabricante VARCHAR(100)) RETURNS DOUBLE
	BEGIN
		DECLARE preciomax DOUBLE DEFAULT 0;
		SELECT MAX(precio)
		INTO preciomax
		FROM producto
		WHERE codigo_fabricante =(
			SELECT codigo 
			FROM fabricante
			WHERE nombre=nombre_fabricante);
		RETURN preciomax;
	END
$$
 
SELECT get_max_valor('Asus');

/*Escribe una función para la base de datos tienda que devuelva el valor mínimo del precio de 
los productos de un determinado fabricante que se recibirá como parámetro de entrada. 
El parámetro de entrada será el nombre del fabricante.*/

USE tienda;
DELIMITER $$
DROP FUNCTION IF EXISTS get_max_valor1 $$
CREATE FUNCTION get_max_valor1 (nombre_fabricante VARCHAR(100)) RETURNS DOUBLE
	BEGIN
		DECLARE preciomax DOUBLE DEFAULT 0;
		SELECT MIN(precio)
		INTO preciomax
		FROM producto
		WHERE codigo_fabricante =(
			SELECT codigo 
			FROM fabricante
			WHERE nombre=nombre_fabricante);
		RETURN preciomax;
	END
$$

SELECT get_max_valor1('Asus');