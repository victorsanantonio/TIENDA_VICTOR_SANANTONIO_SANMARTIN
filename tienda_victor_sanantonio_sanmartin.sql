DROP DATABASE IF EXISTS `tienda_victor_sanantonio_sanmartin`; 
CREATE DATABASE `tienda_victor_sanantonio_sanmartin` CHARACTER SET utf8mb4;
USE `tienda_victor_sanantonio_sanmartin`;

CREATE TABLE `productos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_categoria` int,
  `nombre` varchar(255),
  `descripcion` varchar(255),
  `precio` double,
  `stock` int,
  `fecha_alta` date,
  `fecha_baja` date,
  `impuesto` float
);

CREATE TABLE `categorias` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `descripcion` varchar(255)
);

CREATE TABLE `roles` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `rol` varchar(255)
);

CREATE TABLE `usuarios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_rol` int,
  `email` varchar(255),
  `clave` varchar(255),
  `nombre` varchar(255),
  `apellido1` varchar(255),
  `apellido2` varchar(255),
  `direccion` varchar(255),
  `localidad` varchar(255),
  `provincia` varchar(255),
  `telefono` varchar(255),
  `dni` varchar(255)
);

CREATE TABLE `pedidos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` int,
  `fecha` timestamp,
  `metodo_pago` varchar(255),
  `estado` varchar(255),
  `num_factura` varchar(255),
  `total` double
);

CREATE TABLE `detalles_pedido` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_pedido` int,
  `id_producto` int,
  `precio_unidad` float,
  `unidades` int,
  `impuesto` float,
  `total` double
);

CREATE TABLE `opciones_menu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_rol` int,
  `opcion` varchar(255)
);

CREATE TABLE `configuracion` (
  `id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `clave` varchar(255),
  `valor` varchar(255),
  `tipo` varchar(255)
);

CREATE TABLE `valoraciones` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_producto` int,
  `id_usuario` int,
  `valoracion` int,
  `comentario` varchar(255)
);

CREATE TABLE `proveedores` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `direccion` varchar(255),
  `localidad` varchar(255),
  `provincia` varchar(255),
  `telefono` varchar(255),
  `cif` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `descuentos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `codigo` varchar(255),
  `descuento` float,
  `fecha_inicio` date,
  `fecha_fin` date
);

CREATE TABLE `impuestos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `impuesto` float
);

CREATE TABLE `metodos_pago` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `metodo_pago` varchar(255)
);

--
-- Inserting data into table productos
--
INSERT INTO productos(id, id_categoria, nombre, descripcion, precio, stock, fecha_alta, fecha_baja, impuesto) VALUES
(1, 1, 'Subcycllet', 'Necessitatibus illo libero. Rerum saepe veritatis. Qui quia voluptatum. Atque omnis qui. Error magni perspiciatis. Ullam ipsam quod! Et aut sit.', 2572, 20, '1995-05-01', '2011-07-18', 8),
(2, 2, 'Comcessedator', 'Aperiam neque aut. Voluptate fuga culpa; exercitationem cum quaerat. Natus excepturi est. Exercitationem cum qui! Atque vitae qui. Minus sapiente laudantium!', 2742, 412, '2020-05-03', '2006-07-08', 13),
(3, 3, 'Armpickry', 'Eaque aut sit. Quisquam nesciunt perspiciatis. Aut earum voluptatem. Cum quis earum! Aut eius in. Consequuntur eaque alias! Illo qui natus; animi at nostrum.', 2876, 38, '1979-05-28', '1970-01-07', 18),
(4, 4, 'Concordfiar', 'Laboriosam officiis incidunt. Sit nesciunt ipsum? Sapiente officia pariatur. Sit qui quibusdam? Quod tempora illum. Dolore perspiciatis voluptatum! Soluta.', 2617, 485, '2007-06-08', '1994-03-18', 14),
(5, 5, 'Charwoofor', 'Eaque vitae sed. Perspiciatis laboriosam rerum. Quis iste nostrum. Velit quos dolores. Ullam corporis blanditiis. Amet quos nulla. Suscipit porro cumque;', 946, 438, '2016-10-05', '1984-01-29', 9),
(6, 6, 'Speakjectphone', 'Qui ipsa quasi quia saepe in a...', 1737, 247, '2013-06-20', '2014-03-26', 18),
(7, 7, 'Micjectommscope', 'Et sunt sequi rerum quia facilis autem. Soluta molestiae nostrum? Consequatur molestias fugiat quia sunt aut! Enim sit veniam iste natus.', 2150, 174, '2001-07-16', '1972-03-12', 7),
(8, 8, 'Tabcordlet', 'Ut sit reprehenderit. Et ducimus fugit! Ea sed eveniet. Error molestiae dolores! Natus iste assumenda. Voluptas iure dicta; iure debitis dicta. Et animi.', 1575, 7, '1970-01-08', '1970-11-05', 7),
(9, 9, 'Transpickexra', 'Minima earum veritatis quis vel; doloremque sed omnis suscipit facere velit. Esse perspiciatis nihil quidem iure beatae iusto!', 1573, 8, '1970-01-09', '2016-01-23', 8),
(10, 10, 'Cleantelledgor', 'Recusandae a vero. Odio nulla eligendi. Perspiciatis quo optio! Omnis in eveniet. Unde iure ea. Deleniti adipisci tempore. Libero omnis ad. Voluptates rerum.', 443, 249, '1977-09-24', '1976-01-24', 19),
(11, 11, 'Monoputry', 'Harum enim provident assumenda eos deleniti perspiciatis. Dolorem repellat sequi in omnis at officiis!', 4243, 436, '1972-09-13', '2008-02-29', 19),
(12, 12, 'Subcordedgphone', 'Unde ut error qui. Pariatur reiciendis quis quod! Iste qui est omnis impedit omnis. Sit aspernatur sint. Animi excepturi quibusdam.', 1265, 335, '1992-05-22', '1970-01-10', 6),
(13, 13, 'Ampteller', 'Impedit voluptatem omnis. Quod ut adipisci soluta assumenda; est sint est amet. Nisi harum vel! Enim et error. Non fuga eum!', 518, 70, '1970-01-01', '1970-10-26', 18),
(14, 14, 'Tabtectra', 'Sint aut quae voluptas obcaecati enim. Totam sequi modi. Asperiores aliquid saepe! Veritatis excepturi perferendis. Voluptates facilis omnis; laudantium eos.', 1221, 500, '2013-09-26', '1990-10-07', 19),
(15, 15, 'Playculphone', 'Sequi accusantium laboriosam odio accusantium. Ullam eum aut. Nemo aspernatur et natus! Odit facilis odit id laboriosam eaque est.', 973, 222, '1976-05-04', '1995-12-29', 13),
(16, 16, 'Tablifior', 'Nesciunt quae suscipit ratione consectetur error omnis.', 988, 400, '1977-05-17', '2020-05-24', 5),
(17, 17, 'Teceivewer', 'Maiores exercitationem error unde. Ipsam sed deleniti; voluptas ab iste quam suscipit. Consequatur animi et facere et animi. Ut sit rerum!', 419, 484, '1983-02-18', '2002-09-02', 10),
(18, 18, 'Transbandentor', 'Nisi debitis asperiores. Est id mollitia. Eum sit voluptate! Repellendus autem maxime? Error et non. Error non labore. Nisi at reiciendis.', 55, 109, '2017-10-31', '2002-05-13', 9),
(19, 19, 'Teceivefridge', 'Ea inventore iure ut quisquam a voluptatem.', 685, 369, '1985-05-06', '1970-01-07', 20),
(20, 20, 'Charpickra', 'Voluptatem alias atque. Debitis et praesentium. Quos quasi et. Est ea sed! Unde quibusdam qui. Nisi et facere. Enim iste perspiciatis.', 2004, 490, '2017-07-11', '1984-03-14', 11),
(21, 21, 'Cablifiupscope', 'Nemo similique sed. Voluptatibus fugit quia! Quod tempore error. Magnam et rem! Repellendus architecto sed. Reprehenderit et ut? Vel voluptas facere!', 240, 290, '1971-11-17', '2000-10-26', 9),
(22, 22, 'Cartceivscope', 'Labore ipsum dolorem. Velit itaque mollitia. Cumque dolor dolore! Perspiciatis animi odio. Vel impedit molestiae. Veniam vitae dolorum. Molestias et;', 3062, 443, '1970-01-04', '1977-02-28', 21),
(23, 23, 'Charceivscope', 'Tempora est rerum. Totam labore vel. Perspiciatis placeat exercitationem; reprehenderit et cum. Dolorem quis qui. Omnis tempore voluptatem? Ducimus rem hic.', 615, 366, '1990-08-17', '2017-11-10', 11),
(24, 24, 'Armtopommor', 'Voluptatum aliquam tenetur voluptatem ullam aliquid et.', 4465, 73, '2004-03-09', '2007-03-19', 20),
(25, 25, 'Cleantinscope', 'Et est totam harum placeat; ipsum non enim perspiciatis suscipit. Dolore consequatur iusto ratione aut suscipit. Omnis provident ut? Repellendus dolores quos.', 61, 397, '2010-08-27', '2004-08-23', 16),
(26, 26, 'Comcordentor', 'Magni qui voluptatem. Et perspiciatis error sed error voluptate sed. Quaerat autem incidunt! Necessitatibus vero ducimus. Qui voluptatem aspernatur. Repellat...', 2991, 8, '1980-02-28', '2000-05-31', 8),
(27, 27, 'Armholdar', 'Voluptatibus provident ut nulla qui cupiditate sunt.', 330, 382, '2019-06-20', '1991-08-20', 5),
(28, 28, 'Tweetleedator', 'Est sit et. Natus reprehenderit quia; sit magnam quis. Quam minima sint. Voluptatem repellendus eaque. Necessitatibus omnis magni. Dolore perspiciatis.', 36, 122, '1986-08-10', '1990-07-29', 21),
(29, 29, 'Comtaer', 'Quos repellat corporis saepe et est sed. Est qui natus magni ad expedita repellendus!', 893, 23, '1970-01-08', '2015-03-27', 5),
(30, 30, 'Ampniaquer', 'Dolorem praesentium repellendus. Velit asperiores cum? Ipsa labore ut! Porro et sunt? Facilis voluptatem cupiditate. Nostrum quia laudantium. Qui repellat.', 171, 1, '1970-03-17', '1982-10-04', 16),
(31, 31, 'Monoputridge', 'Nostrum voluptates dolorum. Consequatur perspiciatis non. Ut aspernatur ut! Minima perspiciatis consectetur. Temporibus quibusdam quaerat; animi perspiciatis;', 3562, 389, '2011-03-24', '1977-09-21', 5),
(32, 32, 'Tabcordar', 'Provident quae error neque praesentium qui; deserunt rerum omnis voluptas. Accusantium consequatur perspiciatis facere labore explicabo. Similique doloremque?', 65, 143, '2000-06-11', '1979-02-12', 18),
(33, 33, 'Tweettinphone', 'Nostrum magni ad minima fuga quas illum.', 3524, 272, '1984-12-06', '2006-12-09', 21),
(34, 34, 'Readculepscope', 'Repudiandae officiis perspiciatis. Dolores unde at. Aut tempore odit? Omnis id quidem. Quae asperiores qui. Ea nam rem. Distinctio unde quae. Aut officia.', 622, 448, '1989-11-22', '1971-01-05', 17),
(35, 35, 'Cartjectscope', 'Commodi molestiae et. Ut sapiente laborum. Enim sit nulla? Harum omnis quia! Hic soluta mollitia. Officiis odio nesciunt! Enim cum accusamus.', 4265, 189, '1989-05-10', '2001-09-29', 13),
(36, 36, 'Conputar', 'Eius aut quia ex unde fugit sunt.', 243, 365, '2005-06-04', '1975-10-25', 20),
(37, 37, 'Cabceivar', 'Distinctio excepturi voluptas et. Nisi illo nam qui distinctio! Rerum unde possimus provident alias. Consequatur qui eligendi omnis minus est.', 3031, 183, '2008-01-15', '2018-07-24', 16),
(38, 38, 'Contara', 'Rem qui aut; veniam quia quae. Possimus neque ex. Nam error omnis; atque ea nihil. Dolorum vitae et! Explicabo et ut.', 2857, 39, '1996-08-10', '2016-01-29', 16),
(39, 39, 'Combandor', 'Laborum rem aut nesciunt quia. Dolor voluptas est aut molestias repellat; sapiente ut recusandae? Id libero molestias recusandae sit aperiam id. Quo et ad.', 65, 65, '1978-04-26', '2001-03-25', 12),
(40, 40, 'Stereomutphone', 'Debitis illo vel. Ullam ducimus autem aut ut quasi! Expedita aut repudiandae deleniti omnis earum; numquam et qui? Distinctio eum earum.', 1982, 360, '1994-11-30', '2009-10-18', 7),
(41, 41, 'Cartcordgaar', 'Ipsam et voluptatem. Incidunt numquam sit. Inventore voluptate voluptas. Suscipit officia nobis! Officia nihil perferendis. Ducimus pariatur ut! Aut officiis.', 1303, 67, '2020-08-17', '2003-08-12', 6),
(42, 42, 'Tweettaollry', 'Magnam non amet dolorem modi optio modi...', 3155, 243, '1970-03-07', '1970-01-08', 21),
(43, 43, 'Playtiner', 'Dignissimos temporibus velit pariatur quia neque voluptatem.', 26, 26, '1970-01-01', '1978-07-15', 13),
(44, 44, 'Computerra', 'Veritatis id voluptatem. Molestiae ut officia. Omnis temporibus ut! Enim iure rerum. Blanditiis aut voluptatem. Error alias soluta! Eius nostrum voluptas?', 3350, 210, '2013-03-24', '1983-04-14', 15),
(45, 45, 'Stereoniollar', 'Nihil iste obcaecati. Dolor et iste. Dignissimos quia ipsam. Rerum alias voluptas. Iste modi ut! Perspiciatis similique quis? Porro dicta sequi. Unde.', 87, 87, '1985-01-10', '1978-10-07', 6),
(46, 46, 'Armmutor', 'Omnis laborum quibusdam laboriosam accusantium. Possimus quos et natus aspernatur illo. Distinctio sit veniam sit qui necessitatibus debitis.', 4619, 65, '2000-12-22', '1970-04-02', 18),
(47, 47, 'Playtellator', 'Quas non voluptas consequuntur aliquid voluptate nemo. Omnis et aut. Voluptas sunt vero. Omnis suscipit vitae. Reiciendis aspernatur placeat; maiores illum.', 3688, 204, '2015-02-10', '2021-04-26', 9),
(48, 48, 'Micceivewentor', 'Dolorem illo rem qui. Et magnam est unde eum et dolorem. Natus nobis est et animi enim provident. Aut rem quis. Quia asperiores perferendis.', 229, 2, '2004-03-03', '1989-08-17', 7),
(49, 49, 'Comcyclinry', 'Facere laborum rerum sit laudantium. Sunt quisquam accusantium. Architecto corporis odit alias omnis eum maiores. Hic error quia soluta iste...', 2923, 379, '2006-11-01', '1980-10-21', 18),
(50, 50, 'Printfindoper', 'Iste rerum ipsam. Ut quia error. Sapiente aperiam quae. Et nisi aut. Ipsa eius dolorem. Ullam officia ad! Voluptas delectus omnis.', 744, 125, '1970-01-10', '1973-11-04', 8);

--
-- Inserting data into table usuarios
--
INSERT INTO usuarios(id, id_rol, email, clave, nombre, apellido1, apellido2, direccion, localidad, provincia, telefono, dni) VALUES
(1, 1, 'v@gmail.com', '1234', 'Víctor', 'San Antonio', 'San Martín', '4th FL', 'Darlingford', 'Saskatchewan', '+33 0 92 73 64 02', '229121Y'),
(2, 2, 'Ridgeway87@example.com', 'WHMW61BO689633N6A7YSU09O', 'Keneth', 'Dover', NULL, '48th Floor', 'Nippers Harbour', 'Nova Scotia', '+33 5 81 70 02 03', '366219J'),
(3, 3, 'Tenney195@example.com', '2N722G1IW4S31', 'Conception', 'Cates', 'Rios', '7th FL', 'Zenon Park', 'Yukon Territory', '+49-5886-133664', '231910Z'),
(4, 4, 'Goddard15@example.com', 'S', 'Jude', 'Beauchamp', 'Nolan', '5th Floor', 'Resolute', 'Nova Scotia', '+971 1 470 5916', '207206S'),
(5, 5, 'Addie.Robles76@example.com', 'I264V17NLLN510G2JN46GF', 'Lindsay', NULL, 'Ripley', 'Equitable Building', 'Gilbert Plains', 'Nunavut', '+55 47 7092-3200', '303609V'),
(6, 6, 'Baugh18@example.com', '2P2ED2143KZ950M', 'Abe', 'Cathey', 'Vail', '61th Floor', 'St. Ferdinand d''Halifax', 'Nova Scotia', '+971 4 445 6035', '646667F'),
(7, 7, 'NedaD_Mcqueen915@example.com', '8N3VK44', 'Conrad', NULL, 'Mancini', '8th Floor', 'Dartmouth', NULL, '+32 0 178 12 62', '239095J'),
(8, 8, 'AbernathyC6@nowhere.com', 'WX2H8Q2J6', 'Albertina', 'Spears', 'Jewell', '70th FL', 'Louisbourg', 'British Columbia', '+49 3279 203724', '431020D'),
(9, 9, 'kbuf6081@nowhere.com', '7MT5AJ8TFD41QA0DQ1197', 'Benton', 'Beaudoin', 'Shaw', '6th Floor', 'St-Aime', 'New Brunswick', '+971 0 034 9853', NULL),
(10, 10, 'Slyvia.Mcgraw@example.com', '38K56P3L4H5PZ3X1F92C6628W7FATQ2', 'Charlesetta', 'Irving', 'Almanza', '44th Floor', 'Alsask', 'Northwest Territories', '+49 (5048) 160688', '792347V'),
(11, 11, 'JackieFitch@example.com', '3', 'Bernard', 'Goetz', 'Valadez', NULL, NULL, 'Ontario', '+49 (2943) 642030', '641627T'),
(12, 12, 'Arnoldo_Aguiar2@example.com', '78X08BX9Y568533', 'Robin', NULL, 'Shay', '9th FL', 'Thurso', 'Nunavut', '+49-8306-434542', '208210M'),
(13, 13, 'CynthiaWSeverson@nowhere.com', 'LN855343WGAMW6', 'Clare', 'Weston', 'Valdes', '9th Floor', 'St-Albert', 'Saskatchewan', '+49 (2518) 336189', '683599U'),
(14, 14, 'Truman_Buckner327@example.com', 'B3WF7BM1GMT01F2B400X02UOL38HWMW81UN3QWQ', 'Tommie', 'Lynch', 'Mancuso', '90th FL', 'Reston', 'British Columbia', '+380 30 652-855-3', '013884Y'),
(15, 15, 'NildaLand55@example.com', 'X2NR8O2T2D6374790FJBC8X3', 'Warner', 'Dow', NULL, '4th Floor', 'Nisku', 'Yukon Territory', '+44 5730 589199', '303371X'),
(16, 16, 'plogr13@example.com', 'VM7YW60OZTG5EI7H2ID', 'Elias', 'Cato', 'Shea', '68th FL', 'Gillam', 'British Columbia', NULL, '892417Z'),
(17, 17, 'Oneill@example.com', '2X03FDFLW250L74L8B47MP12G3DF5AHAA', 'Manuela', 'Goff', 'Valdez', '67th FL', 'Louisdale', 'Alberta', '+49 8736 332802', '472429R'),
(18, 18, 'Acker53@nowhere.com', 'I24UWW6DVK53D7LIU56S9255881ZX8BP9HZ44EI7L745G56UL6VG3G5TAU543DYH43K8466H6KTIIM924P20216XPAND6U07440M9X2F14L36A9SEQQWUJEPIMQHT6H20OP1911U601EGPR22L68940X', 'Milan', NULL, 'Shearer', '6th FL', 'Dashwood', 'Alberta', '+49 1209 243731', '768986A'),
(19, 19, 'MichaeleAlbrecht@example.com', '4N29RV6V5SGUB7D07', 'Rhett', 'Beaulieu', NULL, '4th FL', 'Niton Junction', 'Saskatchewan', '+32 9 756 29 05', '041848H'),
(20, 20, 'Broderick125@example.com', '2CTEO0', 'Joseph', 'Speed', 'Brinson', 'Bartlett Bldg', 'Gilmour', 'Quebec', '+420 094 663 667', '676075V'),
(21, 21, 'Crouch8@example.com', '63', 'Clifton', 'Irwin', 'Valencia', '5th FL', 'St. Fidele', 'New Brunswick', '+44 5484 919378', '571796Q'),
(22, 22, 'Madrid6@example.com', 'WU2K193148228A80W33DTCS74ERTT8N02L3EQB5', 'Marquis', 'Mcgill', 'Almeida', '90th Floor', 'Louiseville', 'Nunavut', '+971 5 376 2108', NULL),
(23, 23, 'AdelaCatron3@example.com', 'J8S32V8L02', 'Lena', 'Lynn', 'Sheehan', NULL, NULL, 'Ontario', '+380 26 745-838-4', '693677A'),
(24, 24, 'BrainSalter@example.com', 'A0TX01K4F7I6C8B8V0CK62A38P0S49444T968RAI628UC65073V570', 'Karl', 'Wetzel', 'Noland', '80th FL', 'Tignish', 'Northwest Territories', '+44 6189 57 8680', '139120E'),
(25, 25, 'Redd@nowhere.com', '7SP80QOEA5X66OZ6N3060JQ78BY1R5O1VO5SBC4L0ORQ70X4J70BY9IF9H5OO57Z5C0I204KIWDJ9I10B5CWFO7967SCX1WVSE32CN56594QFY98230456G808', 'Lasonya', 'Catron', NULL, '77th Floor', 'Niverville', 'British Columbia', '+32 4 675 55 50', '978605D'),
(26, 26, 'Kaplan@example.com', 'J', 'Denis', 'Isaac', NULL, '7th Floor', 'Dauphin', 'Alberta', '+49-8011-264363', NULL),
(27, 27, 'Adrien.JAbernathy225@nowhere.com', 'M', 'Kanesha', 'Payne', 'Ritchey', '4th FL', 'Lourdes', NULL, '+33 0 79 53 82 29', '100748I'),
(28, 28, 'Alger@example.com', '23RS33O3', 'Brooks', 'Dowd', 'Nolen', '7th Floor', 'Restoule', 'Ontario', '+52 53 9441 8255', '123913Q'),
(29, 29, 'AdenaS_Archer@example.com', 'V21V035594QMXG6QWO4AEI80M745E6231XL7WTMB65NSDD9G4Q965E01A1L3I1I1T8KDZ77LDSO30871PHM', 'Aleisha', 'Mcginnis', 'Jewett', '4th FL', 'Burlington', 'Manitoba', '+32 3 929 93 87', NULL),
(30, 30, 'AndresE@example.com', '4HU7697JBGRWRDD9WK364M17T2BJFILBL3I62RL868GZA0CBI22B6A', 'Winston', 'Beauregard', 'Valenti', '6th Floor', 'Altario', 'Prince Edward Island', '+32 1 650 68 01', '283699Q'),
(31, 31, 'Melvin_Seymour263@example.com', '9XEO0337756P02V865', 'Rachal', 'Speer', 'Sheets', '4th Floor', 'Nobel', 'Newfoundland and Labrador', '+49-4896-668249', '489159I'),
(32, 32, 'GailMcculloch869@nowhere.com', '86WH4X5I9S8', 'Jason', 'Whalen', 'Valentin', '7th Floor', 'St. Francois Xavier', 'Saskatchewan', '+33 1 02 48 71 09', '108070Z'),
(33, 33, 'Ahrens@example.com', 'DE88TQ6', 'Perla', 'Caudill', 'Ritchie', '87th FL', 'Revelstoke', NULL, '+32 9 597 19 49', '909870L'),
(34, 34, 'Amato32@example.com', '86R0P1WOQ2OND8LZW9C858G5N6IGG13760Z210W41CEX5PL084HP7Z4WK1REL9K5QLP2A484TF3', 'Cleveland', 'Beaver', 'Maness', NULL, NULL, NULL, '+52 58 1930 9853', '466711Y'),
(35, 35, 'Mills@example.com', 'FA062O0O7QI6735I527XJ1J', 'Heath', 'Payton', 'Briones', '6th FL', 'St. Gabriel de Rimouski', 'Saskatchewan', '+380 44 762-224-8', '710163X'),
(36, 36, 'CarlitaRBoyer@example.com', '6886ZEQICU5B55W9RXY0OL18N', 'Conrad', 'Lyon', NULL, '6th Floor', 'Burnaby', NULL, '+33 0 08 45 49 44', NULL),
(37, 37, 'Arce@nowhere.com', 'B86J0JD2OAZ3NA77277C414XWKSEJVTQG801N6GPBXG0B98', 'Slyvia', 'Spellman', 'Noonan', '81th Floor', 'Altona', 'Prince Edward Island', '+32 8 201 79 50', '273687L'),
(38, 38, 'AgustinaAgnew@example.com', '259W332I1P8AQ4V1J', 'Arlyne', 'Mcgovern', 'Jimenez', '5th Floor', 'St-Alexandre-de-Kamouraska', 'Newfoundland and Labrador', '+52 22 5192 9938', NULL),
(39, 39, 'Jacks@example.com', '0X109', 'Nelida', 'Peachey', 'Ritter', '51th FL', 'Gimli', 'Alberta', NULL, '503748V'),
(40, 40, 'AbigailBurchett98@example.com', 'X', 'Laurie', 'Mcgowan', 'Mangum', '78th FL', 'Burns Lake', 'New Brunswick', '+971 8 570 8402', '055315J'),
(41, 41, 'NatalieWilmoth@example.com', '9D237IG410FZT2H1GLQEZ96MH5G7F94P5RVNBZ63848CLM', 'Arnulfo', 'Goforth', NULL, '99th Floor', 'Alvena', NULL, '+52 99 3026 6042', '169438V'),
(42, 42, 'PollyChristianson9@example.com', '766F5M33R6WFH8S46Q6H6ME3NHD53C1', 'Arline', NULL, NULL, '78th FL', 'Burnt Islands', 'Alberta', '+49 (4714) 719689', NULL),
(43, 43, 'Flanagan6@example.com', '2C419PFHNQBSR18UZ4H980668I', 'Stefanie', 'Caudle', 'Almond', '8th Floor', 'Louvicourt', 'New Brunswick', '+44 5248 39 2094', '495151O'),
(44, 44, 'AlejandroAbrams@example.com', '6BF55R2Z5384', 'Pearline', 'Dowdy', 'Jobe', '66th FL', 'Daveluyville', 'Nunavut', '+44 3692 618668', NULL),
(45, 45, 'BrittnyStaples@example.com', 'O4T462026U2893', 'Abby', 'Isaacs', 'Manley', '76th Floor', 'Rhein', 'Manitoba', '+44 304 794 2581', NULL),
(46, 46, 'LamontLively24@nowhere.com', '2631617A2UN41M7', 'Shauna', 'Lyons', 'Norfleet', '67th FL', 'Tilbury', 'British Columbia', '+49-7406-328042', '150955S'),
(47, 47, 'Margherita_Cavanaugh251@nowhere.com', 'F1W67ZG5M6392F7K6', 'Lisandra', NULL, NULL, '83th FL', 'St. Gedeon de Beauce', 'Newfoundland and Labrador', NULL, '100457B'),
(48, 48, 'Alexis_Dutton@nowhere.com', 'L3FF3S4TO33X8Y958K9MYDNN3GA36VFDHQ38TF7O043L85J3FG5729J39Z0YUDRQCK4NW63Q79ZOTZ97P1HQ0JCXAZ4HTF26FV8J', 'Carey', 'Goins', 'Sheffield', '8th Floor', 'Nobleford', 'Saskatchewan', '+971 0 625 1995', '873268C'),
(49, 49, 'Ainsworth@example.com', '5P', 'Salvatore', 'Peacock', NULL, '6th Floor', 'Alvinston', 'Northwest Territories', '+52 08 8962 4588', '270149Q'),
(50, 50, 'CynthiaL_Adams@example.com', '99NMSJ34MHFT53Q1S9KN5N', 'Stella', NULL, 'Briscoe', '5th FL', 'Girardville', 'Prince Edward Island', NULL, '847603B');