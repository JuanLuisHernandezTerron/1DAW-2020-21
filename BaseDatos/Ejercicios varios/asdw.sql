SELECT f.nombre, p.nombre, p.precio AS precioProducto
FROM fabricante f, producto p
WHERE f.codigo=p.codigo_fabricante
AND p.codigo=(
	SELECT codigo FROM producto
	WHERE precio=(
		SELECT MAX(precio) FROM producto
		)
	);
	
SELECT horas FROM trabaja_en 
WHERE dni=(
	SELECT dni FROM empleados
	WHERE apellidos='Silva'
);


SELECT d.nombred, l.lugar 
FROM departamentos d, lugares_dptos l
WHERE d.numd=l.numd 
AND  l.lugar='Sevilla';

/*Diseñar un procedimiento que según el número de empleados nos muestre:
“Pequeña o mediana empresa” si el número de empleados es menor o igual que 10.
En caso contrario debe mostrar: “Gran empresa”.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS proce1$$
CREATE PROCEDURE proce1(num_empleados INT)
	BEGIN
		IF (num_empleados <= 10) THEN
			SELECT ('PequeñaEmpresa');
		ELSE 
			SELECT ('Gran Empresa');
		END IF;
	END $$

CALL proce1('9');

/*Diseñar un procedimiento que según el número total de horas de trabajo de todos
los proyectos (en Robótica) muestre:*/
/*a. Si el número total de horas de trabajo es menor que 25: debe mostrar el
	nombre de todos los empleados (para notificarles que el rendimiento es muy
	bajo).*/

	/*b. Si el número total de horas se encuentra entre 25 y 100: debe mostrar un
	mensaje indicado que todo es normal.*/
	
	
	
	/*c. Y otro caso: (como el número de horas es elevado) premiar a los empleados
	incrementando su sueldo en un 10 %*/
	
USE robotica;
DELIMITER $$
DROP PROCEDURE IF EXISTS prueba $$
CREATE PROCEDURE prueba(numero INT)
BEGIN
	DECLARE horas INT DEFAULT 0;
	SELECT SUM(trabaja_en.horas)
	INTO horas
	FROM trabaja_en;
	
	IF (numero < 25) THEN 
		SELECT nombre
      FROM empleados; 
	ELSEIF (numero>=25 AND numero<=100) THEN
		SELECT('TODO OK');
	ELSE
		SELECT nombre, salario*1.1 
		FROM empleados;
	END IF;	
END
$$

CALL prueba(102);

/*Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, 
que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc). 
Y devuelva como salida los siguientes valores teniendo en cuenta la forma de pago seleccionada 
como parámetro de entrada:
	*el pago de máximo valor,
	*el pago de mínimo valor,
	*el valor medio de los pagos realizados,
	*la suma de todos los pagos,
	*el número de pagos realizados para esa forma de pago.
Deberá hacer uso de la tabla pago de la base de datos jardineria.*/

USE jardineroa;
DELIMITER $$
DROP PROCEDURE IF EXISTS ej2 $$
CREATE PROCEDURE ej2(forma_pago1 VARCHAR(40))
BEGIN
	SELECT MAX(total), MIN(total), AVG(total), SUM(total), COUNT(forma_pago)
	FROM pago
	WHERE forma_pago=ej2;
END
$$

CALL ej2('Cheque');

