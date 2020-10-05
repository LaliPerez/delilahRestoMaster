const express = require('express');
const sequelize = require('./../../mysql');
const server = express();

//Middlewares
const authMiddleware = require('./../../middlewares/auth')
const adminMiddleware = require('./../../middlewares/admin')

// post a new order, all registered users
server.post('/',authMiddleware, async (req, res) => { 
    try {      
        const paymentMethod = Object.values(req.body[0])[0];    
        const user = Object.values(req.body[1])[0];
        await sequelize.query(`
            INSERT INTO orders
            (payment_method_id, status_id, user_id)
            VALUES 
            (?, ?, ?)`,
            {replacements: [paymentMethod, 1, user]} // El valor 1 indica que la orden es nueva
            );           
        const data = await sequelize.query('SELECT MAX(id) FROM orders ', { type: sequelize.QueryTypes.SELECT })
        const last_order = Object.values(data[0])[0]
        async function insertProduct(product,index,array) {
            await sequelize.query(`
                INSERT INTO order_products
                (order_id, product_id)
                VALUES 
                (?, ?)`,
                {replacements: [last_order, product.product_id]}
            );
        };
        req.body.forEach(insertProduct);
        res.send({"Mensaje":"Your order was processed!!"})
} catch(err) {
    res.statusCode = 400
    console.log(err)
}
})

//get order by order id 
server.get('/:id', authMiddleware, adminMiddleware, async (req,res) => { 
    try {
    const data = await sequelize.query(`SELECT c.name estado, a.created_at hora, a.id numero_orden, e.name descripcion, f.name pago, b.name usuario, b.address direccion FROM orders as a JOIN users b ON a.user_id = b.id JOIN order_status c ON a.status_id = c.id JOIN order_products d ON d.order_id = a.id JOIN products e on e.id = d.product_id JOIN payment_methods f ON f.id = a.payment_method_id WHERE a.id = ${req.params.id}`, { type: sequelize.QueryTypes.SELECT })
    if (data.length > 0) {
        res.send(data)
    } else {
        res.send({"message": "This order has no information"})
    }
} catch(err) {
    res.statusCode = 400
    res.send({
        message: "Information is not available"
    });
    console.error("Opps something went wrong. Error: " + err)
}
});

//get list of orders of all clients (admin role)
server.get('/', authMiddleware, adminMiddleware, async (req, res) =>{
    const data = await sequelize.query(
        'SELECT * FROM orders',
        {type: sequelize.QueryTypes.SELECT},
    )
    res.send(data); 
});

//change order´s status or payment_method: admin only access
server.put('/:id', authMiddleware, adminMiddleware, async (req, res) => { 
    try{
       const { payment_method_id, status_id } = req.body;
        await sequelize.query(`
            UPDATE orders SET
            payment_method_id = ?,
            status_id = ?
            WHERE id = ${req.params.id}`,
        {replacements: [payment_method_id,status_id]});
        
        res.send({"Mensaje":"Order update completed"})
} catch(err) {
    res.statusCode = 400
    res.send({
        message: "Order status or payment method cannot be updated"
    });
    
    console.error("Somenthing went wrong Error: " + err);
}
});

//delete order by id: admin only access
server.delete('/:id', authMiddleware, adminMiddleware, async (req, res) => { 
    try{
         await sequelize.query(
             'DELETE FROM orders WHERE id = :id',
         {replacements: {id: req.params.id}});
         
         res.send({"Message":"Success! Order deleted"})
 } catch(err) {
    res.statusCode = 400
    res.send({
        message: "Error: Order wasn´t removed"
    });
     
     console.error("Order wasn´t removed" + err);
 }

})


module.exports = server;

