const express = require('express');
const sequelize = require('./../mysql');
const server = express();

module.exports = {
   verifyUserAndMail: (req, res, next) => {
        sequelize.query('SELECT username FROM users WHERE username = :username', 
            { replacements: req.body, type: sequelize.QueryTypes.SELECT } )
            .then(results => {
                const {username} = results[0] || {}
                if (username === req.body.username) {
                    return res.status(401).end('Cannot create account, username is already used.')
                } else {
                    sequelize.query('SELECT email FROM users WHERE email = :email',
                    { replacements: req.body, type: sequelize.QueryTypes.SELECT } )
                    .then(results => {
                        const {email} = results[0] || {}
                        if (email === req.body.email) {
                            return res.status(401).end('Cannot create account, email already used.')
                        } else {
                            next()
                        }
                    })
                }
            })
            .catch( error => res.status(400).json({ error: 'Error'}) )
    },
}