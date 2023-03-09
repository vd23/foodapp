const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const { Product } = require('../models/product');
const Order = require('../model/order');

// Add Product
adminRouter.post('/admin/add-product', admin, async (req,res) => {
    try{
        const { name, description, images, quantity, price, category } = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });

        product = await product.save();
        res.json(product);
    
    }catch(e){
        res.status(500).json({ error: e.message })
    }
});

// Get all your products
// /admin/get-products

adminRouter.get('/admin/get-products',admin, async (req,res) => {
    try{
        const products = await Product.find({description:'aaaaa'} );
        res.json(products);
    
    }catch(e){
        res.status(500).json({ error: e.message });

    }
});

//Delete the product
adminRouter.post("/admin/delete-product", admin, async(req, res) => {
    try{
        const { id } = req.body;
        let product = await Products.findByIdAndDelete(id);
        res.json(product);
    }catch(e){
        res.status(500).json({ error: e.message });
    }
});

adminRouter.get('/admin/get-orders', admin , async(req, res) => {
    try{
        const orders = await orders.find({});
        res.json(orders);

    }catch(e){
        res.status(500).json({error: e.message});

    }
})

module.exports = adminRouter;