const express = require('express');
const sequelize = require('./../../mysql');
const server = express();

const jwt = require('jsonwebtoken');
const config = require ('./../../configuration');

//Middlewares
const authMiddleware = require('./../../middlewares/auth')
const adminMiddleware = require('./../../middlewares/admin')

server.post('/login', async (req, res) => {
    const { username, password }  = req.body;  

    try{
        const data = await sequelize.query(
            `SELECT users.*, user_roles.name role 
            FROM users 
            JOIN user_roles ON users.role_id = user_roles.id
            WHERE username = ? AND password = ?`,         
            { replacements: [username, password], type: sequelize.QueryTypes.SELECT }
        );

        if(data.length) {
            const token = jwt.sign({
                username: data[0].username,
                role: data[0].role
            }, config.firma)

            res.send({
                username: data[0].username,
                token,
            });
        } else{
            res.send("Username or password is incorrect.")
        }

    } catch(err){
        res.send(err)
    }    
});

module.exports = server;