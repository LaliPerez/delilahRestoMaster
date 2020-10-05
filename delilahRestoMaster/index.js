const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const config = require ('./configuration');
const sequelize = require('./mysql');
const server = express();

//Routes
const ordersRoutes = require('./routes/orders');
const productsRoutes = require('./routes/products');
const usersRoutes = require('./routes/users');
const authRoutes = require('./routes/auth');

server.use(bodyParser.json());

server.use('/orders', ordersRoutes);
server.use('/products', productsRoutes);
server.use('/users', usersRoutes);
server.use('/auth', authRoutes)

// Generic error detection
server.use((err, req, res, next) => {
	if (!err) return next();
	console.log("An error has occurred", err);
	res.status(500).send('Error');
});

// Server load
server.listen(3000,() =>  {
	const date = new Date();
    console.log(`Delilah Resto - Server Started on ${date} on port 3000`);
});






