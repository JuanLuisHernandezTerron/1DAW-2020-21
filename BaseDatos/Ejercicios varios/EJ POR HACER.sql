/*-------------------------------------------------------------CURSORES--------------------------------------------------------------------*/
/*Escribe las sentencias SQL necesarias para crear una base de datos llamada test, una tabla llamada alumnos y 4 
sentencias de inserción para inicializar la tabla. La tabla alumnos está formada por las siguientes columnas:
	id (entero sin signo y clave primaria)
	nombre (cadena de caracteres)
	apellido1 (cadena de caracteres)
	apellido2 (cadena de caracteres
	fecha_nacimiento (fecha)
Una vez creada la tabla se decide añadir una nueva columna a la tabla llamada edad que será un valor calculado a partir 
de la columna fecha_nacimiento. Escriba la sentencia SQL necesaria para modificar la tabla y añadir la nueva columna.

Escriba una función llamada calcular_edad que reciba una fecha y devuelva el número de años que han pasado desde la 
fecha actual hasta la fecha pasada como parámetro:

	Función: calcular_edad
	Entrada: Fecha
	Salida: Número de años (entero)
Ahora escriba un procedimiento que permita calcular la edad de todos los alumnmos que ya 
existen en la tabla. Para esto será necesario crear un procedimiento llamado actualizar_columna_edad que calcule la edad de cada alumno 
y actualice la tabla. Este procedimiento hará uso de la función calcular_edad que hemos creado en el paso anterior.*/

DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE alumnos(
	id INT UNSIGNED PRIMARY KEY,
	nombre VARCHAR(20),
	apellidos1 VARCHAR(20),
	apellidos2 VARCHAR(20),
	fecha_nacimiento DATE 
);

INSERT INTO alumnos(id, nombre, apellidos1, apellidos2, fecha_nacimiento) VALUES('1','Juan','Perez','Perez1','2009-02-23');
INSERT INTO alumnos(id, nombre, apellidos1, apellidos2, fecha_nacimiento) VALUES('2','Luis','carretero','carretero1','2015-02-18');
INSERT INTO alumnos(id, nombre, apellidos1, apellidos2, fecha_nacimiento) VALUES('3','Andres','Torrejon','Torrejon1','2012-02-19');
INSERT INTO alumnos(id, nombre, apellidos1, apellidos2, fecha_nacimiento) VALUES('4','Julio','Hernanadez','Hernanadez1','2009-02-20');

ALTER TABLE alumnos
ADD COLUMN edad INT AFTER fecha_nacimiento;

DELIMITER $$
	DROP FUNCTION IF EXISTS calcular_edad $$
	CREATE FUNCTION calcular_edad(fecha_nacimiento DATE) RETURNS INT 
	BEGIN
		DECLARE edad INT DEFAULT 0;
		DECLARE año_actual DATE DEFAULT SYSDATE();
			IF año_actual>fecha_nacimiento THEN
				SET edad=DATEDIFF(año_actual,fecha_nacimiento)/365;
			RETURN edad;
			END IF;
	END
$$

SELECT calcular_edad('2001-01-01');

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_columna_edad $$
CREATE PROCEDURE actualizar_columna_edad()
	BEGIN
		DECLARE edad INT DEFAULT 0;
		DECLARE done INT DEFAULT FALSE;
		DECLARE cur1 CURSOR FOR SELECT edad FROM test.alumnos;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done= TRUE;
		OPEN cur1;
		
		WHILE done= FALSE DO
			FETCH cur1 INTO edad;
			IF done=FALSE THEN
				SELECT calcular_edad()
				INTO edad
				FROM alumnos;
			END IF;
		END WHILE;
		CLOSE cur1;
	END
$$

CALL actualizar_columna_edad();
/*Modifica la tabla alumnos del ejercicio anterior para añadir una nueva columna email. 
Una vez que hemos modificado la tabla necesitamos asignarle una dirección de correo electrónico de forma automática.
Escriba un procedimiento llamado crear_email que dados los parámetros de entrada: nombre, apellido1, apellido2 y dominio, 
cree una dirección de email y la devuelva como salida.

Procedimiento: crear_email
Entrada:
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
dominio (cadena de caracteres)
Salida:
email (cadena de caracteres)
devuelva una dirección de correo electrónico con el siguiente formato:

El primer carácter del parámetro nombre.
Los tres primeros caracteres del parámetro apellido1.
Los tres primeros caracteres del parámetro apellido2.
El carácter @.
El dominio pasado como parámetro.
Ahora escriba un procedimiento que permita crear un email para todos los alumnmos que ya existen en la tabla. 
Para esto será necesario crear un procedimiento llamado actualizar_columna_email que actualice la columna email de la tabla alumnos. 
Este procedimiento hará uso del procedimiento crear_email que hemos creado en el paso anterior.*/

/*Escribe un procedimiento llamado crear_lista_emails_alumnos que devuelva la lista de emails de la tabla alumnos separados por un punto y coma. 
Ejemplo: juan@iescelia.org;maria@iescelia.org;pepe@iescelia.org;lucia@iescelia.org.*/

/*-----------------------------------------------------TRIGGERS------------------------------------------------------------------*/

/*Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas.
Tabla alumnos:

id (entero sin signo)
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
nota (número real)
Una vez creada la tabla escriba dos triggers con las siguientes características:

Trigger 1: trigger_check_nota_before_insert
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de inserción.
Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.
Trigger2 : trigger_check_nota_before_update
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de actualización.
Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.
Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers 
se están ejecutando correctamente.*/

DROP DATABASE IF EXISTS test_trig;
CREATE DATABASE test_trig;
USE test_trig;

CREATE TABLE alumnos(
	id INT UNSIGNED PRIMARY KEY,
	nombre VARCHAR(20),
	apellidos1 VARCHAR(20),
	apellidos2 VARCHAR(20),
	nota DOUBLE 
);

DELIMITER $$
DROP TRIGGER IF EXISTS trigger_check_nota_before_insert$$
CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT 
ON alumnos FOR EACH ROW
BEGIN
  IF NEW.nota < 0 THEN
    set NEW.nota = 0;
  ELSEIF NEW.nota > 10 THEN
    set NEW.nota = 10;
  END IF;
END
$$

DELIMITER $$
DROP TRIGGER IF EXISTS trigger_check_nota_before_update$$
CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE 
ON alumnos FOR EACH ROW
BEGIN
  IF NEW.nota < 0 THEN
    set NEW.nota = 0;
  ELSEIF NEW.nota > 10 THEN
    set NEW.nota = 10;
  END IF;
END
$$

INSERT INTO alumnos VALUES (1, 'Pepe', 'López', 'López', -1);
INSERT INTO alumnos VALUES (2, 'María', 'Sánchez', 'Sánchez', 11);
INSERT INTO alumnos VALUES (3, 'Juan', 'Pérez', 'Pérez', 8.5);

SELECT * FROM alumnos;

UPDATE alumnos SET nota = -4 WHERE id = 1;
UPDATE alumnos SET nota = 14 WHERE id = 2;
UPDATE alumnos SET nota = 9.5 WHERE id = 3;

SELECT * FROM alumnos;
/*Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas.
Tabla alumnos:

id (entero sin signo)
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
email (cadena de caracteres)
Escriba un procedimiento llamado crear_email que dados los parámetros de entrada: nombre, apellido1, apellido2 y dominio, 
cree una dirección de email y la devuelva como salida.

Procedimiento: crear_email
Entrada:
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
dominio (cadena de caracteres)
Salida:
email (cadena de caracteres)
devuelva una dirección de correo electrónico con el siguiente formato:

El primer carácter del parámetro nombre.
Los tres primeros caracteres del parámetro apellido1.
Los tres primeros caracteres del parámetro apellido2.
El carácter @.
El dominio pasado como parámetro.
Una vez creada la tabla escriba un trigger con las siguientes características:

Trigger: trigger_crear_email_before_insert
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de inserción.
Si el nuevo valor del email que se quiere insertar es NULL, 
entonces se le creará automáticamente una dirección de email y se insertará en la tabla.
Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.
Nota: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.*/
USE test_trig;
CREATE TABLE alumnos1(
	id INT UNSIGNED PRIMARY KEY,
	nombre VARCHAR(20),
	apellidos1 VARCHAR(20),
	apellidos2 VARCHAR(20),
	email VARCHAR(35)  
);

DELIMITER $$
DROP PROCEDURE IF EXISTS crear_email $$
CREATE PROCEDURE crear_email(nombre VARCHAR(20), apellidos1 VARCHAR(20), apellidos2 VARCHAR(20), dominio VARCHAR(20))
    BEGIN 
        SELECT CONCAT(SUBSTRING(nombre, 1, 1),SUBSTRING(apellidos1, 1, 3),SUBSTRING(apellidos2, 1, 3),'@',dominio);
    END
$$

CALL crear_email('Andres','perez','Terron','gmail.es');

DELIMITER $$
DROP TRIGGER IF EXISTS trigger_crear_email_before_insert $$
CREATE TRIGGER trigger_crear_email_before_insert
BEFORE INSERT 
ON alumnos1 FOR EACH ROW
BEGIN
	DECLARE email VARCHAR(30);
	DECLARE dominio_predet VARCHAR(20); 
	SET dominio_predet='iesalixar.org';
	
		IF NEW.email IS NULL THEN
			CALL crear_email(NEW.nombre, NEW.apellidos1, NEW.apellidos2,dominio_predet,dominio_predet);
			SET NEW.email=@email.com;
		END IF;
	END
$$

INSERT INTO alumnos1(id, nombre, apellidos1, apellidos2) VALUES('1','Pedro','Sanchez','Torrejon');

SELECT * FROM alumnos1;
/*Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características:
Trigger: trigger_guardar_email_after_update:

Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de actualización.
Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
La tabla log_cambios_email contiene los siguientes campos:

id: clave primaria (entero autonumérico)
id_alumno: id del alumno (entero)
fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
old_email: valor anterior del email (cadena de caracteres)
new_email: nuevo valor con el que se ha actualizado*/

USE test_trig;
CREATE TABLE log_cambios_email(
	id INT UNSIGNED PRIMARY KEY,
	id_alumnos INT,
	fecha_hora TIMESTAMP,S
	old_email VARCHAR(25),
	new_email VARCHAR(25),
	CONSTRAINT id_alum_log FOREIGN KEY (id_alumnos) REFERENCES alumnos1(id)
);

/*Modifica el ejercicio anterior y añade un nuevo trigger que tenga las siguientes características:
Trigger: trigger_guardar_alumnos_eliminados:

Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de borrado.
Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.
La tabla log_alumnos_eliminados contiene los siguientes campos:

id: clave primaria (entero autonumérico)
id_alumno: id del alumno (entero)
fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
nombre: nombre del alumno eliminado (cadena de caracteres)
apellido1: primer apellido del alumno eliminado (cadena de caracteres)
apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
email: email del alumno eliminado (cadena de caracteres)*/