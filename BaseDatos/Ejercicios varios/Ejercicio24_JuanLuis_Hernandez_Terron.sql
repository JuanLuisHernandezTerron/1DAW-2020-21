DROP DATABASE IF EXISTS EJERCICIO24;
CREATE DATABASE EJERCICIO24;
USE EJERCICIO24;
CREATE TABLE alumnos(
	cod_alum INT(3) PRIMARY KEY,
	nom_alum VARCHAR(21) NOT NULL,
	apelli_alum VARCHAR(30) NOT NULL,
	Curso_alum INT(1) CHECK(Curso_alum='1' OR Curso_alum='2' OR Curso_alum='3'),
	Fecha_matric DATE DEFAULT(SYSDATE())
);

UPDATE alumnos SET apelli_alum=UPPER(apelli_alum);

CREATE TABLE Empleados(
	cod_emple INT(2) PRIMARY KEY,
	nombre_emple VARCHAR(20) NOT NULL,
	apelli_emple VARCHAR(25),
	salario_emple NUMERIC(7,2) CHECK(salario_emple > 0),
	cod_provi INT, 
	cod_empre INT,
	CONSTRAINT cod_provi FOREIGN KEY (cod_provi) REFERENCES hernandezterronjuanluis.provincias(cod_provi) 
	ON UPDATE CASCADE 
	ON DELETE CASCADE,
	CONSTRAINT cod_empre FOREIGN KEY (cod_empre) REFERENCES hernandezterronjuanluis.empresas(cod_empre) 
	ON UPDATE CASCADE 
	ON DELETE CASCADE
);

/*ON DELETE CASCADE*/ 

/*cod_provi INT(2) CONSTRAINT cod_provi_fk REFERENCES provincias,
	cod_emple INT(4) CONSTRAINT cod_emple_fk REFERENCES empresas*/