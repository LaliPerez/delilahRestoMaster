const jwt = require('jsonwebtoken');
const config = require ('./../configuration');

const sendError = (req, res) => {
     res.status = 401;
     res.send({
        status: 401,
        message: "User Unauthorized"
    })
}

module.exports = (req, res, next) => {
    const authHeader = req.headers.authorization;    
    
       if(!authHeader){
       sendError(res)
        }

    const token = authHeader && authHeader.split(' ')[1];
    const authData = jwt.verify(token, config.firma); 
    
    //if is Admin save it
    res.locals.isAdmin = authData.role;

    if (authData){
        return next();
    }
    sendError(res)
}