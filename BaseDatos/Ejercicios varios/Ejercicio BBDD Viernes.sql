/*<---------------------Consultas multitabla (Composición interna)------------------------------->*/
/*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.*/

SELECT p.nombre, p.precio, f.nombre 
FROM producto p, fabricante f
WHERE p.codigo_fabricante=f.codigo;

SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo;

/*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. 
Ordene el resultado por el nombre del fabricante, por orden alfabético.*/

SELECT p.nombre, p.precio, f.nombre 
FROM producto p, fabricante f
WHERE p.codigo_fabricante=f.codigo
ORDER BY f.nombre;

SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo
ORDER BY f.nombre;

/*Devuelve una lista con el código del producto, nombre del producto, 
código del fabricante y nombre del fabricante, de todos los productos de la base de datos.*/

SELECT p.codigo, p.nombre, f.codigo, f.nombre 
FROM producto p, fabricante f
WHERE p.codigo_fabricante=f.codigo;

SELECT p.codigo, p.nombre, f.codigo, f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo;

/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.*/

SELECT p.nombre, p.precio, f.nombre 
FROM producto p, fabricante f
WHERE p.codigo_fabricante=f.codigo 
AND p.precio=(
	SELECT MIN(precio) FROM producto);
	
SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo 
WHERE p.precio=(
	SELECT MIN(precio) FROM producto);
	
/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.*/

SELECT p.nombre, p.precio, f.nombre 
FROM producto p, fabricante f
WHERE p.codigo_fabricante=f.codigo 
AND p.precio=(
	SELECT MAX(precio) FROM producto);
	
SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo 
WHERE p.precio=(
	SELECT MAX(precio) FROM producto);
	
/*Devuelve una lista de todos los productos del fabricante Lenovo.*/

SELECT * 
FROM producto p, fabricante f
WHERE p.codigo_fabricante=f.codigo 
AND f.nombre='Lenovo';

SELECT * 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo 
WHERE f.nombre='Lenovo';

/*Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.*/

SELECT * 
FROM producto p, fabricante f
WHERE p.codigo_fabricante=f.codigo 
AND p.precio > 200;

SELECT * 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo 
WHERE p.precio > 200;

/*Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.*/

SELECT * 
FROM producto p , fabricante f 
WHERE p.codigo_fabricante=f.codigo 
AND (f.nombre='Asus' OR f.nombre='Hewlett-Packard' OR f.nombre='Seagate');

SELECT * 
FROM producto p INNER JOIN fabricante f 
ON p.codigo_fabricante=f.codigo 
WHERE (f.nombre='Asus' OR f.nombre='Hewlett-Packard' OR f.nombre='Seagate');

/*Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.*/

SELECT * 
FROM producto p, fabricante f 
WHERE p.codigo_fabricante=f.codigo 
AND p.codigo_fabricante 
IN(
	SELECT codigo FROM fabricante
	WHERE (f.nombre='Asus' OR f.nombre='Hewlett-Packard' OR f.nombre='Seagate')
	);
	
SELECT * 
FROM producto p INNER JOIN fabricante f 
ON p.codigo_fabricante=f.codigo 
WHERE p.codigo_fabricante 
IN(
	SELECT codigo FROM fabricante
	WHERE (f.nombre='Asus' OR f.nombre='Hewlett-Packard' OR f.nombre='Seagate')
	);
	
/*Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.*/

SELECT p.nombre, p.precio, f.nombre 
FROM producto p , fabricante f
WHERE p.codigo_fabricante=f.codigo 
AND f.nombre 
LIKE '%e';

SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo 
WHERE f.nombre 
LIKE '%e';

/*Devuelve un listado con el nombre y el precio de todos los productos 
cuyo nombre de fabricante contenga el carácter w en su nombre.*/

SELECT p.nombre, p.precio, f.nombre 
FROM producto p, fabricante f
WHERE p.codigo_fabricante=f.codigo 
AND f.nombre 
LIKE '%w%';

SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo 
WHERE f.nombre 
LIKE '%w%';

/*Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que 
tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) 
y en segundo lugar por el nombre (en orden ascendente)*/

SELECT p.nombre, p.precio, f.nombre 
FROM producto p , fabricante f
WHERE p.codigo_fabricante=f.codigo 
AND p.precio >= 180
ORDER BY p.precio DESC, f.nombre ASC;

SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo 
WHERE p.precio >= 180
ORDER BY p.precio DESC, f.nombre ASC;

/*Devuelve un listado con el código y el nombre de fabricante, 
solamente de aquellos fabricantes que tienen productos asociados en la base de datos.*/

SELECT 
DISTINCT f.nombre 
FROM producto p , fabricante f
WHERE p.codigo_fabricante=f.codigo;

SELECT f.nombre 
FROM producto p 
INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo;

/*<------------------------------1.1.7 Subconsultas (En la cláusula WHERE)----------------------------------->*/
/*<------------------------1.1.7.1 Con operadores básicos de comparación------------------->*/

/*Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
SELECT nombre 
FROM producto 
WHERE codigo_fabricante 
=(
	SELECT codigo 
	FROM fabricante
	WHERE nombre='Lenovo');

/*Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo.*/

SELECT * 
FROM producto 
WHERE precio=(
	SELECT MAX(precio) FROM producto p, fabricante f
	WHERE f.codigo=p.codigo_fabricante AND f.nombre='Lenovo');
	
/*Lista el nombre del producto más caro del fabricante Lenovo.*/

SELECT nombre, 
MAX(precio) 
FROM producto
WHERE codigo_fabricante=(
	SELECT codigo 
	FROM fabricante
	WHERE nombre='Lenovo');

/*Lista el nombre del producto más barato del fabricante Hewlett-Packard.*/

SELECT nombre, 
MIN(precio) 
FROM producto
WHERE codigo_fabricante=(
	SELECT codigo 
	FROM fabricante
	WHERE nombre='Hewlett-Packard');
	
/*Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.*/

SELECT * 
FROM producto
WHERE precio >=(
	SELECT MAX(precio) 
	FROM fabricante f , producto p
	WHERE f.codigo=p.codigo_fabricante 
	AND f.nombre='Lenovo'
);

/*Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.*/

SELECT * 
FROM producto 
WHERE precio >(
	SELECT AVG(precio) 
	FROM fabricante f , producto p
	WHERE f.codigo=p.codigo_fabricante 
	AND f.nombre='Asus'
);

/*<------------1.1.7.2 Subconsultas con ALL y ANY-------------------->*/
/*Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.*/
SELECT * 
FROM producto a 
WHERE a.precio 
>= ALL
	(SELECT b.precio 
	FROM producto b);
/*Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.*/

SELECT * 
FROM producto a 
WHERE a.precio 
<= ALL
	(SELECT b.precio 
	FROM producto b
	);
/*Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).*/

SELECT nombre 
FROM fabricante 
WHERE codigo= 
ANY(
	SELECT codigo_fabricante 
	FROM producto);

/*Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).*/

SELECT nombre 
FROM fabricante
WHERE NOT codigo= 
ANY(
	SELECT codigo_fabricante FROM producto);
	
/*<--------------------------------1.1.7.3 Subconsultas con IN y NOT IN--------------------------------->*/
/*Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).*/
SELECT nombre 
FROM fabricante 
WHERE codigo 
IN(
	SELECT codigo_fabricante 
	FROM producto);

/*Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).*/

SELECT nombre 
FROM fabricante 
WHERE codigo 
NOT IN(
	SELECT codigo_fabricante 
	FROM producto);
	
/*<--------------------------1.1.7.4 Subconsultas con EXISTS y NOT EXISTS---------------------------->*/

/*Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).*/

SELECT nombre 
FROM fabricante
WHERE 
EXISTS(
	SELECT codigo_fabricante 
	FROM producto
	WHERE fabricante.codigo=producto.codigo_fabricante
);

/*Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS)*/

SELECT nombre 
FROM fabricante
WHERE 
NOT EXISTS(
	SELECT codigo_fabricante 
	FROM producto
	WHERE fabricante.codigo=producto.codigo_fabricante
);

/*<-----------------1.1.7.5 Subconsultas correlacionadas------------------->*/

/*Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.*/

SELECT DISTINCT  p.nombre, f.nombre, p.precio FROM fabricante f INNER JOIN producto p
ON f.codigo=p.codigo_fabricante 
WHERE p.precio=(
	SELECT MAX(precio) 
	FROM producto p1
	WHERE p.codigo_fabricante=p1.codigo_fabricante
);

/*Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los
 productos de su mismo fabricante.*/
 
SELECT p.nombre, p.codigo, f.nombre, p.precio FROM producto p INNER JOIN fabricante f
ON p.codigo_fabricante=f.codigo
WHERE p.precio >=(
SELECT AVG(precio) FROM producto p2
WHERE p.codigo_fabricante=p2.codigo_fabricante);

/*Lista el nombre del producto más caro del fabricante Lenovo.*/
 
SELECT nombre, MAX(precio) FROM producto 
WHERE codigo_fabricante=(
 SELECT codigo FROM fabricante
 	WHERE nombre='Lenovo');
 	
/*<--------------------------1.1.8 Subconsultas (En la cláusula HAVING)------------------------------------>*/
/*Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.*/

SELECT f.nombre, COUNT(p.codigo_fabricante) 
AS CodigoRepetidos
FROM fabricante f, producto p
WHERE f.codigo=p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo_fabricante)=(
	SELECT COUNT(codigo_fabricante) 
	FROM producto p1, fabricante f1
	WHERE p1.codigo_fabricante=f1.codigo 
	AND f1.nombre='Lenovo');
