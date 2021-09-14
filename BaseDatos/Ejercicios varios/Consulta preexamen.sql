/*Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y y fecha de entrega de los pedidos que no han sido entregados
a tiempo*/
SELECT codigo_pedido, codigo_cliente, fecha_esperada FROM pedido 
WHERE fecha_esperada < fecha_entrega;

/*Devuelve un listado de todos los pedidos que fueron rechazados en
2009.*/


/*Devuelve un listado con el nombre, la gama, el proveedor, el precio de
venta y la cantidad que hay en stock de los productos que pertenecen a
la gama Ornamentales y que tienen más de 100 unidades en stock. El
listado deberá estar ordenado por su precio de venta, mostrando en
primer lugar los de mayor precio*/

SELECT nombre, gama, proveedor, precio_venta, cantidad_en_stock FROM producto
WHERE gama='Ornamentales' AND cantidad_en_stock > 100 
ORDER BY precio_venta DESC;

/*Devuelve un listado con el código del cliente, su nombre y su ciudad de
los clientes que sean de la ciudad de Madrid y cuyo representante de
ventas tenga el código de empleado 11 o 30.*/

SELECT codigo_cliente, nombre_cliente, ciudad FROM cliente
WHERE ciudad='Madrid' AND codigo_empleado_rep_ventas =(
  																	SELECT codigo_empleado FROM empleado
																	  WHERE codigo_empleado= 11)
																	  OR codigo_empleado_rep_ventas =(
																	  						SELECT codigo_empleado FROM empleado
																	 						 WHERE codigo_empleado=30); 

/*  Muestra el nombre de los clientes que viven en la misma ciudad que
donde se encuentra la oficina 'MAD-ES'*/

SELECT nombre_cliente FROM cliente
WHERE ciudad=(
					SELECT ciudad FROM oficina 
					WHERE codigo_oficina='MAD-ES');
					
/*Devuelve un listado con el nombre de la gama de todos los productos
existentes en la base de datos y el número de productos que tiene cada
uno. El resultado deberá estar ordenado alfabéticamente por el nombre
de la gama (de la A a la Z). Ponle un alias adecuado a la columna
correspondiente al número de productos.*/

SELECT gama, cantidad_en_stock AS Numero_de_productos FROM producto
GROUP BY cantidad_en_stock ORDER BY gama ASC;


/*Devuelve el código del producto y la cantidad que hay en stock del
producto que más unidades tiene en stock.*/

SELECT MAX(cantidad_en_stock), codigo_producto FROM producto;

SELECT codigo_producto, cantidad_en_stock FROM producto
WHERE cantidad_en_stock=(
								SELECT MAX(cantidad_en_stock) FROM producto);

/*Calcula cuántos empleados hay en cada puesto. El resultado sólo debe
mostrar dos columnas, una con el nombre del puesto y otra con el
número de empleados que hay en ese puesto (esta columna la debes
llamar 'num_empleados'). El resultado deberá estar ordenado de mayor
a menor número de empleados.*/

SELECT puesto,COUNT(codigo_empleado) AS num_empleados FROM empleado
GROUP BY puesto ORDER BY num_empleados ASC; 

/*Devuelve el nombre, apellido1 y puesto de los empleados que no
representen a ningún cliente.*/

SELECT nombre, apellido1, puesto FROM empleado

WHERE codigo_empleado=(
								SELECT codigo_empleado_rep_ventas FROM cliente
								WHERE codigo_empleado= );
								

/* Devuelve el nombre, los apellidos y el email de los empleados que están
a cargo de Alberto Soria.*/

SELECT nombre, apellidos1, apellidos2, email FROM empleado
	WHERE puesto=(
					SELECT puesto FROM empleado
					WHERE puesto='Representante Ventas');
