USE alixareats;

INSERT INTO empresa(nombre,cif)
VALUES ('Alixareats','23847323B');

INSERT INTO `vehiculo` (`id_vehiculo`, `matricula`, `tipo`) VALUES
(1, '2563GTH', 'Ciclomotor'),
(2, '1234CCC', 'Ciclomotor'),
(3, '2674JTV', 'Ciclomotor'),
(4, '9874LMD', 'Coche'),
(5, '2652FDG', 'Ciclomotor'),
(6, '2685KJU', 'Coche'),
(7, '2485KEU', 'Coche'),
(8, '1683IJU', 'Ciclomotor'),
(9, '1111HHH', 'Coche'),
(10, '2222MMM', 'Ciclomotor');


INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido1`, `apellido2`, `telefono`, `cp`, `pedidos_realizados`, `tipo`) VALUES
(1, 'José', 'Ramirez', 'Gómez', 638569821, 41526, 2, 'Premium'),
(2, 'Angela', 'Terron', 'Ruiz', 638126475, 4152, 12, 'Normal'),
(3, 'Luz Maria', 'Carretero', 'Codina', 648399475, 41900, 0, 'Premium'),
(4, 'Mireia', 'Perdomo', 'Blasco', 648895783, 4152, 0, 'Premium'),
(5, 'André', 'Perejillo', 'Gutierrez', 225418972, 41930, 6, 'Premium'),
(6, 'Lucía', 'Cansino', 'López', 256314872, 41250, 4, 'Premium'),
(7, 'Gustavo', 'Halcón', 'Jimenez', 246324772, 419560, 3, 'Normal'),
(8, 'Sonia', 'Perez', 'Nieto', 286321784, 419560, 5, 'Normal'),
(9, 'Juana', 'Rodriguez', 'Perez', 625894612, 41900, 0, 'Normal'),
(10, 'Juan', 'Jimenez', 'Cañas', 658794523, 41006, 0, 'Premium');

INSERT INTO `premium` (`id_premium`, `direccion`) VALUES
(1, 'Travesía Iván, 03, 1'),
(3, 'Paseo Perea, 1, 8º F'),
(4, 'Avenida Andalucia 98'),
(5, 'C/Ave del paraíso,14'),
(6, 'C/Manolo Rivas,12, E'),
(9, 'Calle la barca, s/n'),
(10, 'Avda del Olivo,24');


INSERT INTO `producto` (`id_producto`, `descripcion`, `nombre`, `precio`, `tipo`) VALUES
(1, 'Big Mac es deliciosa y perfecta, hecha con patties de 100% carne, queso y nuestra salsa especial.', 'Big Mac', '7.20', 'Comida'),
(2, 'Doble de pollo crispy sobre pan de quesos con extra de queso cheddar, queso gouda de cabra', 'Cheese Crispy Chicke', '8.40', 'Comida'),
(3, 'Quesadilla, rellena de doble de queso, jalapeños y salsa Creamy Jalapeño', 'Quesadilla ', '5.30', 'Comida'),
(4, 'Tomate, mozzarella y un toque de orégano', 'Margarita', '9.90', 'Comida'),
(5, 'Una pizza que te trasladará a un mundo que no imaginarás.', 'Pizza Quadroller Kan', '8.00', 'Comida'),
(6, 'Montañas de Nachos autenticas.', 'MontañaNachos', '4.00', 'Comida'),
(7, 'Deliciosa pizza con salsa BBQ, bacon y queso.', 'PizzaBBQ', '8.00', 'Comida'),
(8, 'Auténtico risotto italiano con queso parmigiano.', 'Risotto', '10.00', 'Comida'),
(9, 'Nachos con 4 salsas para compartir', 'Nachos', '6.50', 'Entrantes'),
(10, 'Exquisitos nugget de pollo ', 'Nugget', '4.50', 'Comida'),
(50, 'Deliciosa Duff fresquita', 'Duff', '3.50', 'Bebida'),
(51, 'Fresisuis recién exprimido por el propio Apu', 'Fresisuis', '4.20', 'Bebida');

INSERT INTO `repartidor` (`id_repartidor`, `dni`, `nombre`, `apellido1`, `apellido2`, `telefono`, `id_jefe`, `id_vehiculo`, `id_empresa`) VALUES
(1, '75384240U', 'Agustin', 'hernandez', 'manzano', 956835681, 1, 2, 1),
(2, '76246130S', 'Alfonso', 'guerrero', 'lopez', 624964130, 1, 1, 1),
(3, '65788399L', 'Antonio', 'Garcia', 'Perez', 675834755, 2, 3, 1),
(4, '93784676A', 'Juan', 'Romero', 'Flores', 65578645, 4, 4, 1),
(5, '23569874J', 'José', 'saura', 'gil', 154236789, NULL, NULL, NULL),
(6, '52369825Ñ', 'Pedro', 'alcazar', 'sierra', 635210562, NULL, NULL, NULL),
(7, '53362855Ñ', 'Juan', 'Romeral', 'Jimenez', 635210562, NULL, NULL, NULL),
(8, '53163857Ñ', 'Luis', 'Gallardo', 'Alvarez', 635210562, NULL, NULL, NULL),
(9, '25485693V', 'Dolores', 'Piña', 'Segura', 954752136, 5, 1, 1),
(10, '26563987U', 'Juan', 'Gonzalez', 'Viera', 666352123, 5, 2, 1);

INSERT INTO `pedido` (`id_pedido`, `tamano`, `estado`, `id_repartidor`) VALUES
(1, 'Grande', 'En reparto', 1),
(2, 'Mediano', 'Entregado', 2),
(3, 'Pequeño', 'En reparto', 2),
(4, 'Pequeño', 'Entregado', 4),
(5, 'Grande', 'En reparto', 5),
(6, 'Grande', 'En reparto', 6),
(7, 'Pequeño', 'Entregado', 10),
(8, 'Pequeño', 'Entregado', 10);


INSERT INTO `tienda` (`id_tienda`, `nombre`, `direccion`, `tipo`) VALUES
(1, 'Mcdonals', 'Calle Abedul', 'Americana'),
(2, 'Burguer King', 'Calle abad gordillo', 'Americana'),
(3, 'Taco Bell', 'AV. DE PALMAS ALTAS', 'Mexicana'),
(4, 'Express Vip Pizza', 'Calle Hernán Cortés', 'Pizzería'),
(5, 'Telepizza', 'Calle Kansas', 'Pizzeria'),
(6, 'KiwiPub', 'Calle Torrejon', 'Mexicana'),
(7, 'Taco Bell', 'AV. DE PALMAS ALTAS', 'Americana'),
(8, 'Burguer King', 'Calle Kansas', 'Americana'),
(9, 'Dominos Pizza Triana', 'Calle Pureza', 'Pizzeria'),
(10, 'Burguer La Calle', 'Calle Feria', 'Americana');

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido1`, `apellido2`, `telefono`, `id_jefe`, `id_tienda`) VALUES
(1, 'Enrique', 'Gomez', 'Sanchez', 696128349, 1, 10),
(2, 'Lucas', 'Marquez', 'Lopez', 696234156, 1, 10),
(3, 'Pepe', 'Ocampos', 'Navas', 697958747, 2, 10),
(4, 'Beatriz ', 'Sepulveda', 'Ramirez', 767666524, 2, 10),
(5, 'Jorge', 'Cannavaro', 'Lopes', 215698742, 1, 10),
(6, 'Andrea', 'Romero', 'Cruz', 236514895, 1, 10),
(7, 'Marta', 'Romero', 'Cruz', 226513815, 1, 10),
(8, 'Diego', 'Diaz', 'Ayuso', 225523845, 2, 10),
(9, 'Maria', 'Perez', 'Martin', 654258000, 1, 10),
(10, 'Ana', 'Jimenez', 'Cruz', 698120000, 1, 10);


INSERT INTO `contiene` (`id_producto`, `id_pedido`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

INSERT INTO `proporciona` (`id_producto`, `id_tienda`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 3),
(50, 3),
(51, 3);

INSERT INTO `recibe` (`id_premium`, `id_pedido`) VALUES
(1, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

INSERT INTO `realiza` (`id_usuario`, `id_pedido`, `fecha_hora`) VALUES
(1, 2, '2021-05-07 15:51:47'),
(3, 3, '2021-05-07 15:52:01'),
(4, 4, '2021-05-07 15:52:08'),
(2, 1, '2021-05-07 15:52:22'),
(5, 5, '2021-05-07 14:23:30'),
(6, 6, '2021-05-07 14:23:31'),
(7, 7, '2021-05-07 14:23:31'),
(8, 8, '2021-05-07 14:23:31');