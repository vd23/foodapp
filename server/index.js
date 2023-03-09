// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/products");
// middleware

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://admin:admin123@cluster0.ugijea4.mongodb.net/test?retryWrites=true&w=majority"

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose
.connect(DB)
.then(() =>{
    console.log('Connection Successful');
})
.catch((e) => {
    console.log(e);
});

app.listen(PORT,"0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
    //The $ special character identifies a string literal as an interpolated string 
});
 