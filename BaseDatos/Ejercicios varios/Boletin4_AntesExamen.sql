/*--------------------------------CONSULTA NORMALES-----------------------------------------------------------------------------------------------------*/
/*1º Lista el nombre de todos los productos que hay en la tabla producto.*/

SELECT nombre FROM producto;

/*2º Lista los nombres y los precios de todos los productos de la tabla producto.*/

SELECT nombre, precio FROM producto;

/*3º Lista todas las columnas de la tabla producto.*/

SELECT * FROM producto;

/*4º Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).*/

SELECT nombre,precio*1.21 AS "PrecioDolar" ,precio AS "PrecioEuros" FROM producto;

/*5º Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).*/

SELECT nombre,precio*1.21 AS "PrecioDolar" ,precio AS "PrecioEuros" FROM producto;

/*Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.*/

SELECT nombre AS "NombreProducto",precio*1.21 AS "PrecioDolar" ,precio AS "PrecioEuros" FROM producto;

/*6º Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.*/

SELECT UPPER(nombre), precio FROM producto;

/*7º Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.*/

SELECT LOWER(nombre), precio FROM producto;

/*8º Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres 
del nombre del fabricante.*/

SELECT nombre, UPPER(Left(nombre,2)) FROM fabricante;

/*9º Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.*/

SELECT nombre,ROUND (precio) FROM producto;

/*10º Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.*/

SELECT nombre,TRUNCATE(precio,0) FROM producto;

/*11º Lista el código de los fabricantes que tienen productos en la tabla producto.*/

SELECT f.codigo FROM fabricante f, producto p WHERE f.codigo=p.codigo_fabricante;

/*12º  Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.*/

SELECT DISTINCT f.codigo FROM fabricante f, producto p WHERE f.codigo=p.codigo_fabricante;

/*13º Lista los nombres de los fabricantes ordenados de forma ascendente.*/

SELECT nombre FROM fabricante

ORDER BY nombre ASC;

/*14º Lista los nombres de los fabricantes ordenados de forma descendente.*/

SELECT nombre FROM fabricante

ORDER BY nombre DESC;

/*15º Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.*/

SELECT nombre, precio FROM producto

ORDER BY nombre ASC, precio DESC;

/*16º Devuelve una lista con las 5 primeras filas de la tabla fabricante*/

SELECT * FROM fabricante

LIMIT 5;

/*17º Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.*/

SELECT * FROM fabricante

LIMIT 3, 2;

/*18º Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/

SELECT nombre, precio FROM producto

ORDER BY precio ASC LIMIT 0,1; 

/*19º Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/

SELECT nombre, precio FROM producto

ORDER BY precio DESC LIMIT 0,1; 

/*20º  Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.*/

SELECT nombre FROM producto

WHERE codigo_fabricante=2;

/*------------------------------------------------------------------SUBCONSULTAS------------------------------------------------------------------------------------*/
/*1º Devuelve todos los productos del fabricante Lenovo*/

SELECT nombre FROM producto

WHERE codigo_fabricante=
		(SELECT codigo FROM fabricante WHERE nombre='Lenovo');

/*2º Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo*/

SELECT nombre FROM producto
WHERE codigo_fabricante= (
        SELECT codigo FROM fabricante
        WHERE nombre='lenovo'
);

/*3º Lista el nombre del producto más caro del fabricante Lenovo*/

SELECT * FROM producto
WHERE precio=(
        SELECT MAX(precio) FROM producto
        WHERE codigo_fabricante=(
                SELECT codigo FROM fabricante
                WHERE nombre='Lenovo'
        )
);

/*4º Lista el nombre del producto más barato del fabricante Hewlett-Packard*/

SELECT * FROM producto
WHERE precio=(
        SELECT MIN(precio) FROM producto
        WHERE codigo_fabricante=(
                SELECT codigo FROM fabricante
                WHERE nombre='Lenovo'
        )
);

/*5º Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo*/

SELECT * FROM producto

WHERE precio>=(
					SELECT MAX(precio) FROM producto
					WHERE codigo_fabricante=(
						SELECT codigo FROM fabricante
						WHERE nombre='Lenovo'
					)				
);

/*6º Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos*/



/*--------------------------------------------------------------AGRUPACIONES---------------------------------------------------------------------------------------*/

/*1º Calcula el número total de productos que hay en la tabla productos.*/

SELECT COUNT(nombre) AS 'PRODUCTOS' FROM producto;

/*2º Calcula el número total de fabricantes que hay en la tabla fabricante.*/

SELECT COUNT(nombre) AS 'Fabricantes' FROM fabricante;


/*3º Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.*/

SELECT COUNT(DISTINCT codigo_fabricante) FROM producto;

/*4º Calcula la media del precio de todos los productos*/

SELECT AVG(precio) FROM producto;

/*5º Calcula el precio más barato de todos los productos.*/

SELECT MIN(precio) FROM producto;

/*6º Calcula el precio más caro de todos los productos.*/

SELECT MAX(precio) FROM producto;

/*7º Lista el nombre y el precio del producto más barato.*/

SELECT MIN(precio),nombre FROM producto;

/*8º Lista el nombre y el precio del producto más caro*/

SELECT MAX(precio),nombre FROM producto;

/*9º Calcula la suma de los precios de todos los productos.*/

SELECT SUM(precio) FROM producto;
