-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2020 a las 16:51:05
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `delilah_resto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_method_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status_id`, `created_at`, `payment_method_id`) VALUES
(1, 3, 1, '2020-09-29 21:09:52', 1),
(45, 1, 3, '2020-09-29 21:20:28', 2),
(46, 2, 1, '2020-09-29 13:36:29', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`) VALUES
(1, 1, 5),
(2, 45, 2),
(3, 45, 5),
(4, 46, 6),
(5, 46, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'New'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'New'),
(2, 'Confirmed'),
(3, 'Preparing'),
(4, 'Sending'),
(5, 'Delivered'),
(6, 'Canceled');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`) VALUES
(1, 'Cash'),
(2, 'Credit/Debit card');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `photo` varchar(255) NOT NULL,
  `price_discount` float DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `photo`, `price_discount`, `active`) VALUES
(1, 'Pizza Napolitana', 400, 'https://okdiario.com/img/2016/08/15/pizza-napolitana-sin-gluten-655x368.jpg', 0, 1),
(2, 'Hamburguesa Paris', 650, 'https://media-cdn.tripadvisor.com/media/photo-s/14/0f/c8/a6/big-formule-bartholome.jpg', 0, 1),
(3, 'Bucket de pollo frito con ensalada coleslaw', 350, 'https://clubdecocina.com.ar/images/joomlart/article/3f51ec9d49bc461803b454a4875d5aa8.jpg', 0, 1),
(4, 'Parrillada completa', 1000, 'https://th.bing.com/th/id/OIP.M9dK2Fyv3O2G8DoJ9qtDdAHaE1?w=268&h=180&c=7&o=5&pid=1.7', 0, 1),
(5, 'Brusquetta salmon', 150, 'https://th.bing.com/th/id/OIP.koCj1R-1EiYEJ7VaQN351AHaFj?w=239&h=180&c=7&o=5&pid=1.7', 0, 1),
(6, 'Ensalada rusa', 250, 'https://th.bing.com/th/id/OIP.grTkrGhncNKyZX_PGf9_jQHaEK?w=299&h=180&c=7&o=5&pid=1.7', 0, 1),
(7, 'Porcion papas fritas', 200, 'https://th.bing.com/th/id/OIP.HpmCu56wghci8F_6l_aVegHaEK?w=316&h=180&c=7&o=5&pid=1.7', 0, 1),
(8, 'Ravioles de berenjenas rossini', 350, 'https://www.bertuccis.com/wp-content/uploads/Four-Cheese-Ravioli-1024x819.jpg', 0, 1),
(9, 'Filet de merluza con pure', 450, 'https://www.bing.com/th?id=OIP.H20ZJwA2Oude7YE9rLVpDQAAAA&w=189&h=160&c=8&rs=1&qlt=90&pid=3.1&rm=2', 0, 1),
(12, 'Pastel de papas', 550, 'https://th.bing.com/th/id/OIP.mHySY5DGMit2N5PrY_al1wHaHg?w=180&h=182&c=7&o=5&pid=1.7', 0, 1),
(13, 'Pastel de papas', 550, 'https://th.bing.com/th/id/OIP.mHySY5DGMit2N5PrY_al1wHaHg?w=180&h=182&c=7&o=5&pid=1.7', 0, 1),
(14, 'Pastel de papas', 550, 'https://th.bing.com/th/id/OIP.mHySY5DGMit2N5PrY_al1wHaHg?w=180&h=182&c=7&o=5&pid=1.7', 0, 1),
(15, 'Helado', 150, 'https://th.bing.com/th/id/OIP.mHySY5DGMit2N5PrY_al1wHaHg?w=180&h=182&c=7&o=5&pid=1.7', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `phone`, `address`, `password`, `role_id`) VALUES
(1, 'LauraMPB', 'Laura', 'laurapb@gmail.com', '78453695', 'Av. Pedro Goyena 586', '1234', 1),
(2, 'EnriqueM', 'Enrique Fog', 'Enri@gmail.com', '85236958', 'Senillosa 265', '4444', 2),
(3, 'Kim', 'Kimonam', 'ju@gmail.com', '58967452', 'Macacha Guemes 575', '', 2),
(4, 'Emma', 'Emmita', 'EEmma@gmail.com', '36987452', 'Olavarria 74', '7654', 2),
(12, 'Gloria', 'Sing', 'Glo@gmail.com', '9996595', 'Concordia 78', '3456', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'User');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `orders_ibfk_1` (`user_id`),
  ADD KEY `orders_ibfk_3` (`payment_method_id`);

--
-- Indices de la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_products_ibfk_1` (`order_id`);

--
-- Indices de la tabla `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`);

--
-- Filtros para la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
