/*1º Obtener todos los datos de todos los empleados*/

SELECT * FROM emple 

/*2º Obtener todos los datos de todos los departamentos*/

SELECT * FROM depart

/*3º Idem del 2, pero ordenado por el nombre*/

SELECT * FROM depart

ORDER BY dnombre

/*4º Obtén los salarios y las comisiones de los empleados del departamento 30.*/

SELECT salario, comision, dept_no FROM emple

WHERE dept_no=30 

/*5º (a) Obtén las comisiones de todos los empleados. (b) Obtén las comisiones de los empleados de forma que no se repitan.*/

SELECT * FROM emple;
SELECT DISTINCT comision, apellidos FROM emple;

/*6º Obtén el nombre de empleado y su comisión SIN FILAS repetidas.*/

SELECT DISTINCTROW apellidos, comision FROM emple;

/*7º Obtén los nombres de los empleados y sus salarios, de forma que no se repitan fllas.*/

SELECT DISTINCTROW apellidos, salario FROM emple;

/*8º Obtén las comisiones de los empleados y sus números de departamento, de forma que no se repitan fllas.*/

SELECT DISTINCTROW comision,dept_no FROM emple;

/*9º Obtén los nuevos salarios de los empleados del departamento 30, que resultarán de sumar a su salario una 
gratificación de 1000. Muestra también los nombres de los empleados.*/



/*10º Lo mismo que la anterior, pero mostrando también su salario original, y haz que la columna que almacena 
el nuevo salario se denomine NUEVO SALARIO.*/



/*11º Halla los empleados que tienen una comisión superior a la mitad de su salario.*/

SELECT apellidos FROM emple

WHERE comision>salario/2;

/*12º Halla los empleados que no tienen comisión, o que la tengan menor o igual que el 25 % de su salario.*/

SELECT apellidos FROM emple

WHERE NOT comision OR comision <= salario/4;

/*13º Obtén una lista de nombres de empleados y sus salarios, de forma que en la salida aparezca en todas las fllas 
\Nombre:" y \Salario:" antes del respectivo campo. Hazlo de forma que selecciones exactamente tres expresiones.*/



/*14º Hallar el código, salario y comisión de los empleados cuyo código sea mayor que 7500.*/

SELECT emp_no, salario, comision FROM emple

WHERE emp_no>7500;


/*15º Obtén todos los datos de los empleados que estén (considerando una ordenación ASCII por nombre) a partir de la J, inclusive.*/



/*16º Obtén el salario, comisión y salario total (salario+comisión) de los empleados con comisión, ordenando el resultado por número de empleado.*/



/*17º Lista la misma información, pero para los empleados que no tienen comisión.*/



/*18º Muestra el nombre de los empleados que, teniendo un salario superior a 1000, tengan como jefe al empleado cuyo código es 7698.*/



/*19º Halla el conjunto complementario del resultado del ejercicio anterior*/



/*20º Indica para cada empleado el porcentaje que supone su comisión sobre su salario, ordenando el resultado por el nombre del mismo.*/


