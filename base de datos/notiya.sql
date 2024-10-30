-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 23:34:17
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notiya`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) NOT NULL,
  `AdminPassword` varchar(255) NOT NULL,
  `AdminEmailId` varchar(255) NOT NULL,
  `Is_Active` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `Is_Active`, `CreationDate`, `UpdationDate`) VALUES
(1, 'adminn', '$2y$12$i4LMfeFPQpGSNPTaccIkKuwxAkJ4PhBr3JND7FpXwWFjRvchQn17C', 'notiya@gmail.com', 1, '2020-03-27 17:51:00', '2024-10-30 16:55:17'),
(2, 'admin', '123', 'notiyaa@gmail.com', 1, '2020-03-27 17:51:00', '2024-10-30 16:55:17'),
(3, '123', '123', '123', 1, '2020-03-27 17:51:00', '2024-10-30 16:55:17'),
(4, 'adminn', 'Test@12345', 'notiya@gmail.com', 1, '2020-03-27 17:51:00', '2024-10-30 16:55:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 'Deporte', 'Noticias relacionadas al deporte', '2018-06-06 10:35:09', '2018-06-14 11:11:55', 1),
(6, 'Politica', 'Politica', '2018-06-22 15:46:09', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` char(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblcomments`
--

INSERT INTO `tblcomments` (`id`, `postId`, `name`, `email`, `comment`, `postingDate`, `status`) VALUES
(4, '13', 'Esteban Quito', 'estebanquito@gmail.com', '10 punto', '2024-10-29 23:42:42', 1),
(5, '14', 'Carlos Gomez', '123@gmail.com', 'muy buena nota', '2024-10-30 04:26:13', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'Sobre Nosotros', '<font color=\"#7b8898\" face=\"Mercury SSm A, Mercury SSm B, Georgia, Times, Times New Roman, Microsoft YaHei New, Microsoft Yahei, å¾®è½¯é›…é»‘, å®‹ä½“, SimSun, STXihei, åŽæ–‡ç»†é»‘, serif\"><span style=\"font-size: 26px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></font><br>', '2018-06-30 18:01:03', '2024-10-29 23:37:03'),
(2, 'contactus', 'Contact Details', '<p><br></p><p><b>Direccion:&nbsp; </b>CABA</p><p><b>Número : </b>+54 9 11 2349-323</p><p><b>Mail :&nbsp; </b>notiya@gmail.com</p>', '2018-06-30 18:01:36', '2024-10-29 23:38:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`) VALUES
(13, 'Red Bull estaría dispuesto a pagar 20 millones por Franco Colapinto', 3, 5, '<p><span style=\"font-family: &quot;Albert Sans&quot;, sans-serif; font-size: 16px;\">Desde Europa aseguran que la escudería austríaca está decidida a sumar al argentino y abonaría la enorme cifra para hacerse con sus servicios a tiempo completo y juntarlo con Max Verstappen en 2025.</span></p><p><span style=\"font-family: &quot;Albert Sans&quot;, sans-serif; font-size: 16px;\"><br></span><img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw6OeSEZCSNKbQLNyFY9kTtqBhb5cA8EwrXg&amp;s\" style=\"width: 300px;\"></p><p><span style=\"font-family: &quot;Albert Sans&quot;, sans-serif; font-size: 16px;\"><br></span></p><p>En la antesala de lo que será el Gran Premio de Brasil, el mundo de la Fórmula 1 se vio revolucionado por una fuerte versión que surgió desde Europa y que indica que Red Bull habría ofrecido 20 millones de dólares a Williams para hacerse con los servicios de Franco Colapinto.</p><p><br></p><p>La noticia fue dada por el periodista neerlandés Jack Plooij, quien no sólo aseguró que el ofrecimiento es real, sino que además indicó que sería para que el argentino sea piloto de Red Bull, acompañando a Max Verstappen. De ser así, se confirmaría un interés incluso más fuerte que el que se rumoreaba y que tenía al pilarense como posible refuerzo de RB, el segundo equipo de la escudería austríaca.</p><p><br></p><p><img src=\"https://media.tycsports.com/files/2024/10/29/781697/franco-colapinto_862x485.webp\" style=\"width: 723px;\"><br></p>', '2024-10-29 23:41:51', NULL, 1, 'Red-Bull-estaría-dispuesto-a-pagar-20-millones-por-Franco-Colapinto', '73625a2f3b70c9964689873971ef081f.jpg'),
(14, 'Guerra en Oriente Próximo: última hora de Israel y el ataque a la delegación de Ada Colau y Jaume Asens', 6, 8, '<p>La guerra de Israel contra Hamás tras el ataque de la milicia palestina el 7 de octubre de 2023 se ha cobrado más de 43.000 vidas en la Franja de Gaza y amenaza con convertirse en una contienda regional. El conflicto tiene hasta siete frentes abiertos y se ha recrudecido especialmente en Líbano, donde Israel y Hizbulá combaten cuerpo a cuerpo tras la invasión terrestre por parte del ejército hebreo. El posterior ataque de Irán a Israel con 200 misiles abrió una nueva fase en el polvorín de Oriente Próximo. Israel promete un ataque contra infraestructuras iranís.</p><p><img src=\"https://th.bing.com/th/id/OIP.RJCiRitBM8ONze9CtSOv2gHaDw?rs=1&amp;pid=ImgDetMain\" style=\"width: 474px;\"></p><p>La exalcaldesa de Barcelona Ada Colau ha explicado su testimonio ante el ataque israelí de este martes a la delegación internacional con la que viajaba a Cisjordania: \"No hubo heridos de milagro, porque los soldados dispararon gases lacrimógenos y granadas de sonido de forma arbitraria\". Lo ha dicho en un mensaje de Instagram , en el que comunica la información que ha transmitido al cónsul de España en Jerusalén, Alfonso Lucini, y al Secretario de Exteriores de España, Diego Martínez, quienes la han llamado tras conocer los hechos. Colau ha agradecido la llamada y ha concretado que los soldados han atacado este martes por la mañana a un grupo en \"actitud totalmente pacífica\" y que sabían que la delegación internacional estaba allí para acompañar la recogida de aceitunas porque habían avisado de la visita con una nota de prensa.</p><p><img src=\"data:image/jpeg;base64,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\" style=\"width: 287px;\"><br></p><p><br></p>', '2024-10-30 04:25:50', NULL, 1, 'Guerra-en-Oriente-Próximo:-última-hora-de-Israel-y-el-ataque-a-la-delegación-de-Ada-Colau-y-Jaume-Asens', '4b796e7efe0d75c007f0db60e5da9686jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) DEFAULT NULL,
  `SubCatDescription` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 5, 'Bollywood ', 'Bollywood masala', '2018-06-22 15:45:38', '0000-00-00 00:00:00', 1),
(4, 3, 'Futbol', 'Futbol\r\n', '2018-06-30 09:00:43', '0000-00-00 00:00:00', 1),
(5, 3, 'Automovilismo', 'Automovilismo', '2018-06-30 09:00:58', '0000-00-00 00:00:00', 1),
(6, 5, 'Television', 'TeleVision', '2018-06-30 18:59:22', '0000-00-00 00:00:00', 1),
(7, 6, 'Nacional', 'Nacional', '2018-06-30 19:04:29', '0000-00-00 00:00:00', 1),
(8, 6, 'Internacional', 'Internacional', '2018-06-30 19:04:43', '0000-00-00 00:00:00', 1),
(9, 7, 'India', 'India', '2018-06-30 19:08:42', '0000-00-00 00:00:00', 1),
(10, 3, 'Basket', 'Basket', '2024-10-30 17:51:08', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
