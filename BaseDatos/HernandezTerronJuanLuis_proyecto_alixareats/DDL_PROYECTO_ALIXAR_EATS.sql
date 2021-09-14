USE alixareats;

DROP DATABASE IF EXISTS alixareats;
CREATE DATABASE alixareats;
USE alixareats;

CREATE TABLE vehiculo 
(
id_vehiculo INT(5) PRIMARY KEY AUTO_INCREMENT ,
matricula VARCHAR(7),
tipo VARCHAR(10)
);

CREATE TABLE producto
(
	id_producto INT(5) PRIMARY KEY AUTO_INCREMENT,
	descripcion VARCHAR(50) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	precio DECIMAL(5,2) NOT NULL
);

CREATE TABLE usuario
(
id_usuario INT(5) PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(20) NOT NULL,
apellido1 VARCHAR(20) NOT NULL,
apellido2 VARCHAR(20) NOT NULL,
telefono INT(9) NOT NULL,
cp INT(5) NOT NULL,
pedidos_realizados INT(5) NOT NULL,
tipo VARCHAR(10) CHECK(tipo='Normal' OR tipo='Premium')
);

CREATE TABLE empresa
(
	id_empresa INT(5) PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(20) NOT NULL,
	cif VARCHAR(9) NOT NULL
);

CREATE TABLE tienda
(
    id_tienda INT(5) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(20) NOT NULL
);




create table empleado (
	id_empleado INT(5) PRIMARY KEY AUTO_INCREMENT,
    	nombre VARCHAR(20) NOT NULL,
    	apellido1 VARCHAR(20) NOT NULL,
    	apellido2 VARCHAR(20) NOT NULL,
    	telefono INT(9),
    	id_jefe INT(5),
          id_tienda INT(5),
    	CONSTRAINT fk_empleado_jefe FOREIGN KEY (id_jefe) references empleado(id_empleado)
ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT fk_tie_emp FOREIGN KEY (id_tienda) references tienda(id_tienda)
ON DELETE CASCADE ON UPDATE CASCADE
);




CREATE TABLE repartidor
(
    id_repartidor INT(5) PRIMARY KEY AUTO_INCREMENT,
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    telefono INT(9) NOT NULL,
    id_jefe INT(5),
    id_vehiculo INT(5),
    id_empresa INT(5),
    CONSTRAINT fk_id_jefe FOREIGN KEY (id_jefe) REFERENCES repartidor(id_repartidor) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_id_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES vehiculo (id_vehiculo) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES empresa (id_empresa) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE pedido
(
	id_pedido INT(5) PRIMARY KEY AUTO_INCREMENT,
	tamano VARCHAR(20) CHECK(tamano='Pequeño' OR tamano='Mediano' OR tamano='Grande'),
	estado VARCHAR(20) CHECK(estado='Entregado' OR estado='En reparto' OR estado='En preparación' OR estado='Preparado'),
	id_repartidor INT(5),
	CONSTRAINT repar_pedi_fk FOREIGN KEY (id_repartidor) REFERENCES repartidor(id_repartidor) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE contiene
(
id_producto INT(5),
id_pedido INT(5),
CONSTRAINT contiene_pk PRIMARY KEY(id_producto, id_pedido),
CONSTRAINT produc_conti_fk FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT pedi_conti_fk FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE proporciona
(
id_producto INT(5),
id_tienda INT(5),
CONSTRAINT proporciona PRIMARY KEY(id_producto, id_tienda),
CONSTRAINT produc_propor_fk FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT tien_propor_fk FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE premium
 (
	id_premium INT(5) PRIMARY KEY AUTO_INCREMENT,
	direccion VARCHAR(20) NOT NULL,
	CONSTRAINT fk_id_usuario FOREIGN KEY (id_premium) REFERENCES usuario(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
);





CREATE TABLE recibe 
(
id_premium INT(5) ,
id_pedido INT(5) ,
PRIMARY KEY (id_premium, id_pedido),
CONSTRAINT fk_pre_rec FOREIGN KEY (id_premium) REFERENCES premium (id_premium) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_ped_rec FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE realiza 
(
	id_usuario INT(5),
 	id_pedido INT(5),
  	fecha_hora DATETIME DEFAULT (SYSDATE()),
  	CONSTRAINT fk_usuario_realiza_pedido FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    	CONSTRAINT fk_pedido_realizado_usuario FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE producto
CHANGE descripcion descripcion VARCHAR(100);
ALTER TABLE tienda
CHANGE direccion direccion VARCHAR(50);
ALTER TABLE tienda
ADD COLUMN `tipo` VARCHAR(20) NOT NULL AFTER `direccion`;
ALTER TABLE tienda
ADD CHECK (tipo='Americana' OR tipo='Mexicana' OR tipo='Pizzería');
ALTER TABLE producto
ADD COLUMN `tipo` VARCHAR(20) NOT NULL AFTER `precio`;
ALTER TABLE producto
ADD CHECK (tipo='Bebida' OR tipo='Entrantes' OR tipo='Comida' OR tipo='Postre');


