
/*----------------------------------------CONSULTAS----------------------------*/
/*Consultas SQL: 10 consultas (mínimo 2 sencillas, 2 agrupaciones, 2 subconsultas)*/

SELECT *
FROM empleados
WHERE pais_nacimiento='España';

SELECT *
FROM pilotos
WHERE tipo_piloto='Prueba';

SELECT COUNT(id_mecanico), pais_nacimiento
FROM mecanicos
GROUP BY pais_nacimiento;

SELECT COUNT(id_piloto), tipo_piloto
FROM pilotos
GROUP BY tipo_piloto;

SELECT nombre_coche
FROM coches
WHERE id_coche=(
	SELECT id_coche
	FROM pilotan
	WHERE id_piloto=(
		SELECT id_piloto
		FROM pilotos
		WHERE nombre='Fernando'
	)
);

SELECT COUNT(id_empleado)
FROM empleados
WHERE id_empleado =ANY(
	SELECT id_empleado
	FROM tienen
	WHERE id_escuderia =(
		SELECT id_escuderia
		FROM escuderias
		WHERE nombre_escuderia='Ferrari'
	)
);

SELECT nombre_gran_premio
FROM gran_premio
WHERE id_gran_premio= ANY(
	SELECT id_gran_premio
	FROM disputan
	WHERE id_piloto= ANY(
		SELECT id_piloto
		FROM pilotos
		WHERE tipo_piloto='Oficial'
	)
);

SELECT DISTINCT nombre_escuderia
FROM escuderias e, tienen t, pilotos p, pilotan pil, coches co
WHERE e.id_escuderia=t.id_escuderia
AND t.id_empleado=p.id_piloto
AND p.id_piloto=pil.id_piloto
AND pil.id_coche=co.id_coche
AND fecha_presentacion='2021-03-10';

SELECT nombre_gran_premio
FROM gran_premio
WHERE nombre_gran_premio 
LIKE 'M%';

SELECT nombre
FROM pilotos
WHERE nombre
LIKE '%a%';

/*----------------------------------FUNCIONES Y PROCEDIMIENTOS------------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS get_datos_piloto $$
CREATE PROCEDURE get_datos_piloto(datos_tipo_piloto VARCHAR(10))
BEGIN
	SELECT *
	FROM pilotos
	WHERE tipo_piloto = datos_tipo_piloto;
END
$$

CALL get_datos_piloto('Oficial');

DELIMITER $$
DROP PROCEDURE IF EXISTS get_tipo_piloto $$
CREATE PROCEDURE get_tipo_piloto(datos_piloto VARCHAR(10))
BEGIN
	IF (datos_piloto='Oficial') THEN
		SELECT 'Ha llegado a la élite del motor';
	ELSEIF (datos_piloto='Prueba') THEN
		SELECT 'Tiene que mejorar como piloto';
	ELSE
		SELECT 'Ingresa Oficial o Prueba';
	END IF;
END
$$

CALL get_tipo_piloto('Oficial');

DELIMITER $$
DROP FUNCTION IF EXISTS get_mecanicos $$
CREATE FUNCTION get_mecanicos (escuderia VARCHAR(20)) RETURNS INT
BEGIN
	DECLARE contador INT DEFAULT 0;
	
	SELECT COUNT(id_mecanico)
	INTO contador
	FROM mecanicos
	WHERE id_mecanico IN(
		SELECT id_empleado
		FROM tienen
		WHERE id_escuderia=(
		SELECT id_escuderia
		FROM escuderias
		WHERE nombre_escuderia=escuderia
		)
	);
	RETURN contador;
END
$$

SELECT get_mecanicos('Ferrari');

DELIMITER $$
DROP FUNCTION IF EXISTS get_dias_diferencia $$
CREATE FUNCTION get_dias_diferencia (fecha_gran_premio_uno DATE, fecha_gran_premio_dos DATE) RETURNS DOUBLE
BEGIN
	DECLARE dias DOUBLE;
	SET dias= DATEDIFF(fecha_gran_premio_uno,fecha_gran_premio_dos);
	RETURN dias;
END
$$

SELECT get_dias_diferencia('2021-07-04','2021-06-20');

/*--------------------------------------------TRIGGERS--------------------------------*/

DELIMITER $$
DROP TRIGGER IF EXISTS intro_nuevos_pilotos_pais $$
CREATE TRIGGER intro_nuevos_pilotos_pais
BEFORE INSERT ON pilotos
FOR EACH ROW
BEGIN
	IF NEW.pais_nacimiento = 'Rusia' THEN
		SET NEW.pais_nacimiento = 'Pais_independiente';
	END IF;
END
$$


DELIMITER $$
DROP TRIGGER IF EXISTS fecha_presentacion $$
CREATE TRIGGER fecha_presentacion
BEFORE UPDATE ON coches
FOR EACH ROW
BEGIN
	
	IF NEW.fecha_presentacion > OLD.fecha_presentacion THEN
		SET NEW.fecha_presentacion = DATE_ADD(OLD.fecha_presentacion, INTERVAL 5 DAY);
	ELSEIF NEW.fecha_presentacion < OLD.fecha_presentacion THEN
		SET NEW.fecha_presentacion = OLD.fecha_presentacion;
	END IF;
	
END
$$s