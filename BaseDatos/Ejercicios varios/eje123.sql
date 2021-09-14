/*---------------------------------------------------DISPARADORES-------------------------------------------------------------*/
/*Crear un disparador que cada vez que se inserta un empleado sustituya su nombre por “Pepe”.*/
DELIMITER $$
DROP TRIGGER IF EXISTS cambiar_nombre_por_pepe $$
CREATE TRIGGER cambiar_nombre_por_pepe
BEFORE INSERT
ON empleados FOR EACH ROW
BEGIN
	SET NEW.nombre='Pepe';
	END
$$

/*Escribir un disparador, que cada vez que se modifique un empleado, añada “Don” al principio de su nombre.*/

DELIMITER $$
DROP TRIGGER IF EXISTS añadir_don_nombre_v1 $$
CREATE TRIGGER añadir_don_nombre_v1
BEFORE UPDATE
ON empleados FOR EACH ROW
BEGIN
IF (NEW.nombre NOT LIKE 'Don %') THEN
	SET NEW.nombre=CONCAT('Don ', NEW.nombre);
	END IF;
END
$$

/*Realizar una versión mejorada del ejercicio anterior donde se compruebe que se desea modificar el campo nombre.*/

DELIMITER $$
DROP TRIGGER IF EXISTS añadir_don_nombre_v2 $$
CREATE TRIGGER añadir_don_nombre_v2
BEFORE UPDATE
ON empleados FOR EACH ROW
BEGIN
	IF (NEW.nombre <> OLD.nombre) THEN
	SET NEW.nombre=CONCAT('Don ', NEW.nombre);
	END IF;
END
$$

/*En Empresa, diseñar un disparador que compruebe cada vez que insertamos un
empleado que su edad esté comprendida entre 16 –edad mínima para trabajar– y 67
–edad de jubilación–.*/

DELIMITER $$
DROP TRIGGER IF EXISTS compro_edad $$
CREATE TRIGGER compro_edad
BEFORE INSERT 
ON empleados FOR EACH ROW
BEGIN
	IF (NEW.edad < 16) THEN
		SET NEW.edad=16;
	ELSEIF (NEW.edad > 67) THEN
		SET NEW.edad=67;s
	END IF;
END $$

/*Escribir un disparador que supervise los traslados de los empleados. Éstos pueden
moverse a otra oficina, pero el traslado ha de cumplir que sea a una oficina dentro
de la misma región a la que están asignados. Es decir, si un empleado trabaja en
una oficina del ‘Este’ podrá trasladarse a cualquier otra oficina, pero siempre dentro
de la región ‘Este’.*/

DELIMITER $$
DROP TRIGGER IF EXISTS traslado_emple $$
CREATE TRIGGER traslado_emple
BEFORE UPDATE 
ON empleados FOR EACH ROW
BEGIN
	DECLARE temp_region VARCHAR(20);
	
	SELECT region 
	INTO temp_region
	FROM oficinas o, empleados e
	WHERE e.oficina=o.oficina;
	
	IF (NEW.oficina = OLD.oficina) THEN
	
END
$$