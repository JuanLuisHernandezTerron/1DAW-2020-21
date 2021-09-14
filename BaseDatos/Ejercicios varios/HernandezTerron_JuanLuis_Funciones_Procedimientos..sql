
/*Escribe un procedimiento que reciba un número real de entrada y 
muestre un mensaje indicando si el número es positivo, negativo o cero.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS posi_nega$$
CREATE PROCEDURE posi_nega (X INT)
BEGIN
	IF (X > 0) THEN
		SELECT('Es un numero positivo');
	ELSEIF (X < 0) THEN
		SELECT('Es un numero negativo');
	ELSE 
		SELECT('Es Cero');
	END IF;
END $$

CALL posi_nega(0);

/*Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada 
y realice una consulta sobre la tabla cliente para obtener todos los clientes que existen en la tabla de ese país.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS client_pais$$
CREATE PROCEDURE client_pais (Y VARCHAR(50))
BEGIN
	SELECT nombre_cliente
	FROM cliente
	WHERE pais= Y;
END$$

CALL client_pais('Australia');

/*Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres 
(Ejemplo: PayPal, Transferencia, etc). 
Y devuelva como salida el pago de máximo valor realizado para esa forma de pago. 
Deberá hacer uso de la tabla pago de la base de datos jardineria.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS form_pago$$
CREATE PROCEDURE form_pago(Y VARCHAR(40))
BEGIN
	SELECT MAX(total) 
	AS MaximoValor
	FROM pago
	WHERE forma_pago= Y;
END$$

CALL form_pago('PayPal');

/*Escribe una función que reciba como parámetro de entrada un valor numérico que represente un día de la semana y 
que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. 
Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.*/

DELIMITER $$
DROP FUNCTION IF EXISTS nume_dia$$
CREATE FUNCTION nume_dia(X INT) RETURNS VARCHAR(30)
BEGIN
DECLARE num_dia VARCHAR(30);
	CASE X
		WHEN 1 THEN SET num_dia='Lunes';
		WHEN 2 THEN SET num_dia='Martes';
		WHEN 3 THEN SET num_dia='Miercoles';
		WHEN 4 THEN SET num_dia='Jueves';
		WHEN 5 THEN SET num_dia='Viernes';
		WHEN 6 THEN SET num_dia='Sabado';
		WHEN 7 THEN SET num_dia='Domingo';
	END CASE;
	RETURN num_dia;
END$$

SELECT nume_dia(7);


/*Escribe una función para la base de datos tienda que devuelva el número total de productos que hay en la tabla productos.*/

DELIMITER $$
DROP FUNCTION IF EXISTS num_total_pro$$
CREATE FUNCTION num_total_pro () RETURNS INT(15)
BEGIN
	DECLARE pro_total INT(15);
		SELECT COUNT(codigo)
		INTO pro_total
		FROM producto;
	RETURN pro_total;
END$$

SELECT num_total_pro();

/*Escribe una función para la base de datos tienda que devuelva el valor medio del precio de los productos de un determinado 
fabricante que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.*/

DELIMITER $$
DROP FUNCTION IF EXISTS valor_med$$
CREATE FUNCTION valor_med( Y VARCHAR(30)) RETURNS INT(5) 
BEGIN
	DECLARE media INT(5) DEFAULT 0;
		SELECT AVG(precio)
		INTO medisa
		FROM producto
		WHERE codigo_fabricante IN(
			SELECT codigo
			FROM fabricante
			WHERE nombre= Y 
		);
		
	RETURN media;
END$$

SELECT valor_med('Lenovo');


