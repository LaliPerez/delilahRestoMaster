const express = require('express');
const sequelize = require('./../../mysql');
const server = express();

//Middlewares
const authMiddleware = require('./../../middlewares/auth')
const adminMiddleware = require('./../../middlewares/admin')
const { verifyUserAndMail } = require('./../../middlewares/verifyUserAndMail');

// get all users that are registedered, admin access only
server.get('/', authMiddleware, adminMiddleware, async (req, res) =>{
    const data = await sequelize.query(
        'SELECT * FROM users',
        {type: sequelize.QueryTypes.SELECT},
    )
    res.send(data);
});

//create a new user, sign in, public access
server.post('/', verifyUserAndMail, async (req, res) =>{
    const {username, name, email, phone, address, password, role_id} = req.body;
     try{
        await sequelize.query(
            `INSERT into users 
                (username, name, email, phone, address, password, role_id)
            VALUES
                (?, ?, ?, ?, ?, ? ,?)
            `,
        { replacements:[username, name, email, phone, address, password, role_id] })
        
        res.sendStatus(200);

    } catch(err){
        res.send(err).end('Error')
    }  
});

//modify users name, phone, address, password admin access only
server.put('/:id',  authMiddleware, adminMiddleware, async (req, res) =>{
    const {username, name, email, phone, address, password, role_id} = req.body;
    try{
        await sequelize.query(
        `UPDATE users SET
                name = ?, 
                phone = ?, 
                address = ?, 
                password = ?
        WHERE id = ${req.params.id}
        `,
        {replacements:[name, phone, address, password] });
    
        res.sendStatus(200);
    } catch(err){
        res.send({
        message: "You are not adminstrator"
        });
    }  
});

// delete an user, admin access only
server.delete('/:id', authMiddleware, adminMiddleware, async (req, res) =>{
    try{
        await sequelize.query(
            'DELETE from users WHERE id = :id',
            { replacements: {id: parseInt(req.params.id)} },
        )    
        res.sendStatus(200);
    } catch(err){
        res.send({
        message: "You are not adminstrator"
    });
    }    
});


module.exports = server;