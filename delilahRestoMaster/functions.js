const express = require('express');
const sequelize = require('./mysql');
const server = express();

module.exports = {
    verifyProductId: (req, res, next) => {
        sequelize.query('SELECT id FROM products WHERE id = :id',
            { replacements: req.params, type: sequelize.QueryTypes.SELECT })
            .then(results => {
                if(results[0] === undefined) {
                    res.status(400).end('Invalid Product ID ')
                } else {
                    next()
                }
            })
            .catch(error => res.status(400).end('Error'))
    },
    
    getProductById: (req, res) => {
        sequelize.query('SELECT * FROM products WHERE id = :id ', 
            { replacements: req.params, type: sequelize.QueryTypes.SELECT })
            .then(results => res.status(200).json(results) )
            .catch(error => res.status(400).end('Error'))
    },
    
}