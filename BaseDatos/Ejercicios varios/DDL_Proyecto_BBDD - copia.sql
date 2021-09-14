DROP DATABASE IF EXISTS Formula1;
CREATE DATABASE Formula1;
USE Formula1;

CREATE TABLE escuderias(
id_escuderia INT(5) PRIMARY KEY,
nombre_escuderia VARCHAR(20) NOT NULL,
ciudad_sede VARCHAR(20) NOT NULL
);

CREATE TABLE mecanicos(
id_mecanico INT(5) PRIMARY KEY,
nombre VARCHAR(15) NOT NULL,
apellido1 VARCHAR(15) NOT NULL,
apellido2 VARCHAR(15) NOT NULL,
telefono CHAR(9) NOT NULL,
dni CHAR(9) NOT NULL
);

CREATE TABLE tienen(
id_escuderia INT(5),
id_mecanico INT(5),
CONSTRAINT tienen_pk PRIMARY KEY (id_escuderia, id_mecanico),
CONSTRAINT escu_tienen_fk FOREIGN KEY (id_escuderia) REFERENCES escuderias(id_escuderia) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT meca_tienen_fk FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE coches(
id_coche INT(5) PRIMARY KEY,
nombre_coche VARCHAR(10) NOT NULL,
fecha_presentacion DATE NOT NULL
);

CREATE TABLE reparan(
id_mecanico INT(5),
id_coche INT(5),
CONSTRAINT reparan_pk PRIMARY KEY (id_mecanico, id_coche),
CONSTRAINT meca_repa_fk FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT coch_repa_fk FOREIGN KEY (id_coche) REFERENCES coches(id_coche) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE pilotos(
id_piloto INT(5) PRIMARY KEY,
dni CHAR(9) NOT NULL,
nombre VARCHAR(5) NOT NULL,
apellido1 VARCHAR(9) NOT NULL,
apellido2 VARCHAR(9) NOT NULL,
pais VARCHAR(6) NOT NULL,
tipo_piloto VARCHAR(10) CHECK(tipo_piloto='Oficial' OR tipo_piloto='Prueba') 
);

CREATE TABLE pilotan(
id_piloto INT(5),
id_coche INT(5),
CONSTRAINT pilotan_pk PRIMARY KEY (id_piloto, id_coche),
CONSTRAINT pilo_pilotan_fk FOREIGN KEY (id_piloto) REFERENCES pilotos(id_piloto) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT coch_pilotan_fk FOREIGN KEY (id_coche) REFERENCES coches(id_coche) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE fichan(
id_escuderia INT(5),
id_piloto INT(5),
CONSTRAINT fichan_pk PRIMARY KEY (id_escuderia, id_piloto),
CONSTRAINT escu_fichan_fk FOREIGN KEY (id_escuderia) REFERENCES escuderias(id_escuderia) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT pilo_fichan_fk FOREIGN KEY (id_piloto) REFERENCES pilotos(id_piloto) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE director_carrera(
id_director INT(5) PRIMARY KEY,
dni CHAR(9) NOT NULL,
nombre VARCHAR(10) NOT NULL,
apellido1 VARCHAR(10) NOT NULL,
apellido2 VARCHAR(10) NOT NULL
);

CREATE TABLE contratan(
id_director INT(5),
id_escuderia INT(5),
CONSTRAINT contratan_pk PRIMARY KEY (id_director, id_escuderia),
CONSTRAINT direc_contrat_fk FOREIGN KEY (id_director) REFERENCES director_carrera(id_director) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT escu_contrat_fk FOREIGN KEY (id_escuderia) REFERENCES escuderias(id_escuderia) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE son_dirigido(
id_piloto INT(5),
id_director INT(5),
CONSTRAINT son_dirigido_pk PRIMARY KEY (id_piloto, id_director),
CONSTRAINT pilo_dirigido_fk FOREIGN KEY (id_piloto) REFERENCES pilotos(id_piloto) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT direct_dirigido_fk FOREIGN KEY (id_director) REFERENCES director_carrera(id_director) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE gran_premio(
id_gran_premio INT(5) PRIMARY KEY,
nombre_gran_premio VARCHAR(10) NOT NULL
);

CREATE TABLE disputan(
id_gran_premio INT(5),
id_piloto INT(5),
fecha_gran_premio DATE,
CONSTRAINT disputan_pk PRIMARY KEY(id_gran_premio, id_piloto),
CONSTRAINT granpre_disput_fk FOREIGN KEY (id_gran_premio) REFERENCES gran_premio(id_gran_premio) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT pilo_disput_fk FOREIGN KEY (id_piloto) REFERENCES pilotos(id_piloto) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ordena(
id_director INT(5),
id_mecanico INT(5),
CONSTRAINT ordena_pk PRIMARY KEY (id_director, id_mecanico),
CONSTRAINT direc_ord_fk FOREIGN KEY (id_director) REFERENCES director_carrera(id_director) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT meca_ord_fk FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico) ON DELETE CASCADE ON UPDATE CASCADE
);