
const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
require("dotenv").config();

const app = express();

app.use(cors());
app.use(express.json());

mongoose.connect("mongodb://127.0.0.1:27017/rentease")
.then(() => {
  console.log("MongoDB Connected");
})
.catch((err) => {
  console.log(err);
});

const ProductSchema = new mongoose.Schema({

  name: String,
  category: String,
  rent: Number,
  deposit: Number,
  image: String,
  available: Boolean

});

const Product = mongoose.model("Product", ProductSchema);

app.get("/", (req, res) => {
  res.send("RentEase API Running");
});

app.get("/products", async (req, res) => {

  try {

    const products = await Product.find();

    res.json(products);

  } catch (error) {

    res.status(500).json({
      message: "Server Error"
    });

  }

});

app.post("/products", async (req, res) => {

  try {

    const newProduct = new Product(req.body);

    await newProduct.save();

    res.status(201).json({
      message: "Product Added"
    });

  } catch (error) {

    res.status(500).json({
      message: "Error Adding Product"
    });

  }

});

app.put("/products/:id", async (req, res) => {

  try {

    await Product.findByIdAndUpdate(
      req.params.id,
      req.body
    );

    res.json({
      message: "Updated"
    });

  } catch (error) {

    res.status(500).json({
      message: "Update Failed"
    });

  }

});

app.delete("/products/:id", async (req, res) => {

  try {

    await Product.findByIdAndDelete(
      req.params.id
    );

    res.json({
      message: "Deleted"
    });

  } catch (error) {

    res.status(500).json({
      message: "Delete Failed"
    });

  }

});

const PORT = 5000;

app.listen(PORT, () => {
  console.log(`Server Running On ${PORT}`);
});

