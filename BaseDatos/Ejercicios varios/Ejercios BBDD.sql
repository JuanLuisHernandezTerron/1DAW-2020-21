/*<---------------------1.4.4 Consultas sobre una tabla------------------------------>*/

/*Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.*/

SELECT codigo_oficina, ciudad FROM oficina;

/*Devuelve un listado con la ciudad y el teléfono de las oficinas de España.*/

SELECT ciudad, telefono, pais FROM oficina
	WHERE pais='España';

/*Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.*/

SELECT nombre, apellido1, apellido2, email, codigo_jefe FROM empleado
WHERE codigo_jefe='7';

/*Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.*/

SELECT nombre, apellido1, apellido2, email, codigo_jefe, puesto FROM empleado
WHERE codigo_jefe IS NULL;

/*Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.*/

SELECT nombre, apellido1, apellido2, puesto FROM empleado
WHERE NOT puesto='Representante Ventas';

/*Devuelve un listado con el nombre de los todos los clientes españoles.*/

SELECT * FROM cliente
WHERE pais='Spain';

/*Devuelve un listado con los distintos estados por los que puede pasar un pedido.*/

SELECT estado FROM pedido
GROUP BY estado;

/*Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:*/
/*FUNCION YEAR*/

SELECT DISTINCT codigo_cliente FROM pago
WHERE YEAR(fecha_pago)=2008;

/*FUNCION DATE_FORMAT*/

SELECT codigo_cliente FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y')=2008;

/*SIN YEAR Y SIN DATE_FORMAT*/

SELECT codigo_cliente, fecha_pago FROM pago
WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';

/*Devuelve un listado con el código de pedido, código de cliente, 
fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.*/

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido
WHERE fecha_entrega > fecha_esperada;

/*Devuelve un listado con el código de pedido, código de cliente, 
fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.*/
/*ADDDATE*/

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido
WHERE ADDDATE(fecha_entrega, 2) <= fecha_esperada;

/*DATEDIFF*/

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

/*Devuelve un listado de todos los pedidos que fueron rechazados en 2009.*/

SELECT * FROM pedido
WHERE estado='Rechazado' AND YEAR(fecha_entrega)=2009;

/*Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.*/

SELECT * FROM pedido
WHERE estado='Entregado' AND MONTH(fecha_entrega)=01;

/*Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. 
Ordene el resultado de mayor a menor.*/

SELECT * FROM pago
WHERE YEAR(fecha_pago)=2008 AND forma_pago='PayPal'
ORDER BY total DESC;

/*Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. 
Tenga en cuenta que no deben aparecer formas de pago repetidas.*/

SELECT forma_pago FROM pago
GROUP BY forma_pago;

/*Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. 
El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.*/

SELECT * FROM producto
WHERE gama='Ornamentales' AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;

/*Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y 
cuyo representante de ventas tenga el código de empleado 11 o 30.*/

SELECT * FROM cliente
WHERE ciudad='Madrid' AND (codigo_empleado_rep_ventas=11 OR codigo_empleado_rep_ventas=30);

/*<---------------------1.4.5 Consultas multitabla (Composición interna)s------------------------------>*/

/*Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.*/

SELECT c.nombre_cliente, e.nombre, e.apellido1  FROM cliente c, empleado e
WHERE c.codigo_empleado_rep_ventas=e.codigo_empleado;

SELECT nombre_cliente, nombre, apellido1  FROM cliente INNER JOIN empleado 
ON codigo_empleado_rep_ventas=codigo_empleado;

/*Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas*/
SELECT c.nombre_cliente,e.nombre FROM cliente c, pago p, empleado e
WHERE p.codigo_cliente=c.codigo_cliente AND c.codigo_empleado_rep_ventas=e.codigo_empleado;

SELECT nombre_cliente, nombre FROM cliente c INNER JOIN pago p INNER JOIN empleado e 
ON p.codigo_cliente=c.codigo_cliente AND codigo_empleado_rep_ventas=codigo_empleado;

/*Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.*/
SELECT c.nombre_cliente ,e.nombre FROM cliente c, empleado e
WHERE c.codigo_empleado_rep_ventas=e.codigo_empleado AND c.codigo_cliente NOT IN
			(SELECT codigo_cliente FROM pago
			  );

SELECT nombre_cliente ,nombre FROM cliente INNER JOIN empleado 
WHERE codigo_empleado_rep_ventas=codigo_empleado AND codigo_cliente NOT IN
			(SELECT codigo_cliente FROM pago
			  );
			  
/*Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus 
representantes junto con la ciudad de la oficina a la que pertenece el representante.*/
SELECT c.nombre_cliente, e.nombre, o.ciudad FROM cliente c, pago p, empleado e, oficina o
WHERE c.codigo_cliente=p.codigo_cliente AND c.codigo_empleado_rep_ventas=e.codigo_empleado AND o.codigo_oficina=e.codigo_oficina;

SELECT c.nombre_cliente, e.nombre, o.ciudad FROM cliente c INNER JOIN pago p INNER JOIN empleado e INNER JOIN oficina o
ON c.codigo_cliente=p.codigo_cliente AND codigo_empleado_rep_ventas=codigo_empleado AND o.codigo_oficina=e.codigo_oficina;
/*Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus 
representantes junto con la ciudad de la oficina a la que pertenece el representante.*/
SELECT c.nombre_cliente, e.nombre, o.ciudad FROM cliente c, empleado e, oficina o
WHERE codigo_empleado_rep_ventas=codigo_empleado AND o.codigo_oficina=e.codigo_oficina AND c.codigo_cliente NOT IN
(
SELECT codigo_cliente FROM pago
);

SELECT nombre_cliente, e.nombre, o.ciudad FROM cliente INNER JOIN empleado e INNER JOIN oficina o
ON codigo_empleado_rep_ventas=codigo_empleado AND o.codigo_oficina=e.codigo_oficina AND codigo_cliente NOT IN
(
SELECT codigo_cliente FROM pago
);

/*Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.*/
SELECT DISTINCT o.linea_direccion1, o.linea_direccion2 FROM cliente c ,oficina o, empleado e
WHERE o.codigo_oficina=e.codigo_oficina AND e.codigo_empleado=c.codigo_empleado_rep_ventas AND c.ciudad='Fuenlabrada';

SELECT DISTINCT o.linea_direccion1, o.linea_direccion2 FROM cliente c INNER JOIN oficina o INNER JOIN empleado e
ON o.codigo_oficina=e.codigo_oficina AND e.codigo_empleado=c.codigo_empleado_rep_ventas AND c.ciudad='Fuenlabrada';

/*Devuelve el nombre de los clientes y el nombre de sus representantes junto con 
la ciudad de la oficina a la que pertenece el representante.*/

SELECT c.nombre_cliente, e.nombre, o.ciudad FROM cliente c, oficina o, empleado e
WHERE c.codigo_empleado_rep_ventas=e.codigo_empleado AND e.codigo_oficina=o.codigo_oficina;

SELECT c.nombre_cliente, e.nombre, o.ciudad FROM cliente c INNER JOIN oficina o INNER JOIN empleado e
ON c.codigo_empleado_rep_ventas=e.codigo_empleado AND e.codigo_oficina=o.codigo_oficina;

/*Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.*/
SELECT e.nombre AS NombreJefe, k.nombre AS NombreEmpleado FROM empleado e, empleado k
WHERE e.codigo_empleado=k.codigo_jefe; 

SELECT e.nombre AS NombreJefe, k.nombre AS NombreEmpleado FROM empleado e INNER JOIN empleado k
ON e.codigo_empleado=k.codigo_jefe; 

/*Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.*/
SELECT c.nombre_cliente FROM cliente c ,pedido p
WHERE p.fecha_entrega  > p.fecha_esperada AND c.codigo_cliente=p.codigo_cliente; 

SELECT c.nombre_cliente FROM cliente c INNER JOIN pedido p
ON p.fecha_entrega  > p.fecha_esperada AND c.codigo_cliente=p.codigo_cliente; 

/*Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.*/
SELECT DISTINCT g.gama, c.nombre_cliente FROM gama_producto g, cliente c, pedido p, detalle_pedido de
WHERE c.codigo_cliente=p.codigo_cliente AND p.codigo_pedido=de.codigo_pedido;

SELECT DISTINCT g.gama, c.nombre_cliente FROM gama_producto g INNER JOIN cliente c INNER JOIN pedido p INNER JOIN detalle_pedido de
ON c.codigo_cliente=p.codigo_cliente AND p.codigo_pedido=de.codigo_pedido;
/*<------------------------------------------1.4.7 Consultas resumen--------------------------------------------------->*/

/*¿Cuántos empleados hay en la compañía?*/
SELECT COUNT(codigo_empleado) AS Empleados FROM empleado;

/*¿Cuántos clientes tiene cada país?*/

SELECT COUNT(codigo_cliente) AS Habitantes,pais FROM cliente
GROUP BY pais;

/*¿Cuál fue el pago medio en 2009?*/

SELECT AVG(total) AS MediaAño2009 FROM pago
WHERE YEAR(fecha_pago)=2009;

/*¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.*/

SELECT COUNT(codigo_pedido) AS NºPedidos, estado FROM pedido
GROUP BY estado ORDER BY NºPedidos DESC;

/*Calcula el precio de venta del producto más caro y más barato en una misma consulta.*/
SELECT MAX(precio_venta) AS PrecioMax, MIN(precio_venta) AS PrecioMin FROM producto;

/*Calcula el número de clientes que tiene la empresa.*/

SELECT COUNT(codigo_cliente) AS ClientesQueTieneLaEmpresa FROM cliente;

/*¿Cuántos clientes tiene la ciudad de Madrid?*/
SELECT COUNT(codigo_cliente) AS ClientesDeMadrid FROM cliente
WHERE ciudad='Madrid';

/*¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?*/

SELECT COUNT(codigo_cliente) AS NumeroClientesQueSusCiudadesEmpiecenporM, ciudad FROM cliente
WHERE ciudad LIKE 'M%'
GROUP BY ciudad;

/*Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.*/
SELECT e.nombre, COUNT(c.codigo_cliente) AS Codigo_Cliente FROM cliente c, empleado e
WHERE c.codigo_empleado_rep_ventas=e.codigo_empleado
GROUP BY e.nombre;

/*Calcula el número de clientes que no tiene asignado representante de ventas.*/

SELECT COUNT(codigo_cliente) AS ClientesQueNoTienenAsignadoRepresentante FROM cliente
WHERE codigo_empleado_rep_ventas IS NULL;

/*Calcula la fecha del primer y último pago realizado por cada uno de los clientes. 
El listado deberá mostrar el nombre y los apellidos de cada cliente.*/
SELECT MIN(p.fecha_pago), MAX(f.fecha_pago), c.nombre_contacto, c.apellido_contacto FROM cliente c, pago p, pago f
WHERE c.codigo_cliente=p.codigo_cliente
GROUP BY c.nombre_cliente;

/*Calcula el número de productos diferentes que hay en cada uno de los pedidos.*/

SELECT DISTINCT d.codigo_pedido AS CodigoPedido ,COUNT(codigo_producto) AS TiposdeProductos FROM detalle_pedido d
GROUP BY d.codigo_pedido;

/*Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.*/

SELECT DISTINCT d.codigo_pedido AS CodigoPedido ,SUM(cantidad) AS CantidadDelProducto FROM detalle_pedido d
GROUP BY d.codigo_pedido;

/*Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. 
El listado deberá estar ordenado por el número total de unidades vendidas.*/

SELECT codigo_producto, SUM(cantidad) AS cantidadtotal FROM detalle_pedido
GROUP BY codigo_producto
ORDER BY cantidadtotal DESC
LIMIT 0,20;

/*La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. 
La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. 
El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.*/

SELECT SUM(p.total) FROM pago p;