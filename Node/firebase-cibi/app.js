const express = require('express');
const app = express();
const admin = require('firebase-admin');
const serviceAccount = require("./cibi-2024-firebase-adminsdk-8vdib-6a9175c94f.json");
const bodyParser = require('body-parser');
app.use(bodyParser.json());


const products = [{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 2,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 3,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 4,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 5,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 6,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 7,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 8,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 9,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 10,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 11,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 12,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 13,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 14,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 15,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 16,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 17,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 18,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 19,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 20,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 21,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 22,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 23,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 24,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 25,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 26,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 27,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 28,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 29,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 30,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},
{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},{
  productId: 1,
  productName: "Women's Green Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags","Active Wear"]
},

{
  productId: 2,
  productName: "Women's Black Tshirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-black-friends-typography-boyfriend-t-shirt-234669-1715257520-1.jpg",
  amount: 12,
  discount: 15,
  discountedPrice: 11,
  categories: ["Dress", "Shoes"]
},

{
  productId: 3,
  productName: "Women's Green T-shirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-oversized-t-shirt-612478-1718286273-1.jpg",
  amount: 14,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags"]
},
{
  productId: 4,
  productName: "Women's Green ",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags"]
},

{
  productId: 5,
  productName: "Women's Black",
  productUrl: "https://images.bewakoof.com/t1080/women-s-black-friends-typography-boyfriend-t-shirt-234669-1715257520-1.jpg",
  amount: 12,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags"]
},

{
  productId: 6,
  productName: "Women's Green T-shirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-oversized-t-shirt-612478-1718286273-1.jpg",
  amount: 14,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags", "Jewellery"]
},
{
  productId: 7,
  productName: "Women's Green Oversized",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-white-all-over-printed-oversized-t-shirt-628018-1716987390-1.jpg",
  amount: 123,
  discount: 0,
  discountedPrice: 123,
  categories: ["Dress", "Bags"]
},

{
  productId: 8,
  productName: "Women'sTypography",
  productUrl: "https://images.bewakoof.com/t1080/women-s-black-friends-typography-boyfriend-t-shirt-234669-1715257520-1.jpg",
  amount: 12,
  discount: 11,
  discountedPrice: 110,
  categories: ["Dress", "Bags"]
},

{
  productId: 9,
  productName: "Women's G T-shirt",
  productUrl: "https://images.bewakoof.com/t1080/women-s-green-oversized-t-shirt-612478-1718286273-1.jpg",
  amount: 14,
  discount: 15,
  discountedPrice: 110,
  categories: ["Dress", "Bags"]
}
]



admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://cibi-2024.firebaseio.com"
});

let cartItems = [{
  product_id : 121,
  product_title: "Dalli's Summer Shirt",
  product_image : "https://assets.bonkerscorner.com/uploads/2024/05/15145007/Bonkerscorner_blue-signature-tank-_09.jpg",
  colour : "blue",
  size: "L",
  unit : 2,
  unit_price: 20
 },{
  product_id : 123,
  product_title: "Dalli's Summer Shirt",
  product_image : "https://www.karagiri.com/cdn/shop/files/PurvaSilk-BWPUV-1002-1.jpg?v=1712752309",
  colour : "blue",
  size: "L",
  unit : 2,
  unit_price: 20
 },{
  product_id : 124,
  product_title: "Dalli's Summer Shirt",
  product_image : "https://ambraee.com/cdn/shop/products/Project_20230208_0079.jpg?v=1691226624&width=1800",
  colour : "blue",
  size: "L",
  unit : 2,
  unit_price: 20
 }];


app.post("/cart/add/:productId",(req,res)=>{
  console.log(req.params.productId);
    for(let i=0;i<cartItems.length;i++){
      if(req.params.productId == cartItems[i].product_id){
         cartItems[i].unit++;
      }
    }
    return res.status(200).json({success:true})
})
app.post("/cart/remove/:productId",(req,res)=>{
   for(let i=0;i<cartItems.length;i++){
      if(req.params.productId == cartItems[i].product_id){
         cartItems[i].unit--;
      }
    }
    return res.status(200).json({success:true})
})

app.post("/cart",(req,res)=>{
  console.log(req.headers);
    const item = req.body.item
    console.log(item);
    cartItems.push(item);
    setTimeout(()=>{
      return res.status(200).json({success:true,item:item})
    },5000);
  
});

app.get("/cart/:id",(req,res)=>{
     return res.status(200).json({success:true,data:cartItems});      
})


app.get("/product",(req,res)=>{
    const productId = req.query.productId;
    console.log(productId);
    const productDetails  = {
      productId:121,
      productTitle : "Women's G T-Shirt",
      price:123,
      caraousel : [
        "https://images.bewakoof.com/t1080/women-s-purple-music-is-my-escape-graphic-printed-t-shirt-519260-1715258076-1.jpg",
        "https://images.bewakoof.com/t1080/women-s-purple-music-is-my-escape-graphic-printed-t-shirt-519260-1695391115-2.jpg",
        "https://images.bewakoof.com/t1080/women-s-purple-music-is-my-escape-graphic-printed-t-shirt-519260-1695391131-5.jpg",
        "https://images.bewakoof.com/t1080/women-s-purple-music-is-my-escape-graphic-printed-t-shirt-519260-1695391120-3.jpg"
      ],
      shortDescription : "Women's Purple Music Is My Escape Graphic Printed T-shirt",
      reviews : {
        stars:4.5,
        totalPeople:19143,
        ratings : {
          sizing : 0.5,
          color : 0.3,
          quality:0.7
        }
      },
      productInfo:{
           product_name : "Women's G T-Shirt",
           description : "Wrap yourself in timeless elegance with our luxurious silk sari. Crafted from the finest quality silk, this exquisite garment seamlessly blends traditional craftsmanship with contemporary style.",
           features :[
            "Premium Silk Fabric: Made from high-quality silk, this sari boasts a smooth texture and a lustrous sheen, ensuring you look and feel your best on any occasion.",
            "Intricate Design: Adorned with intricate motifs and delicate embellishments, this sari exudes sophistication and grace",
            "Versatile Styling: Whether you're attending a wedding, festival, or any special event, this versatile sari is sure to make you stand out.",
            "Comfortable Drape: The lightweight and breathable fabric ensure all-day comfort, allowing you to move with ease.",
            "Rich Color Palette: Available in a range of vibrant hues and timeless shades, there's a perfect silk sari to complement every skin tone and personal style.",
            "Length and Width: Generously sized to provide ample fabric for draping, allowing for various traditional and modern draping styles.",
            "Easy Maintenance: This silk sari is easy to care for, making it a practical addition to your wardrobe.",
            "Perfect Gift: Whether for yourself or a loved one, this silk sari makes a thoughtful and luxurious gift choice."
          ],
          brand:"This Sari is locally designed by Adith Wari, a Designer from Mumbai. You can find more details about this designer on Instagram",
          size:"Length: Standard 5.5 meters \nWidth: Approximately 45 inches",
          care_instructions:"Dry clean recommended to maintain the silk's luster and longevity. Alternatively, hand wash gently in cold water with mild detergent and air dry in shade.",
      }
    }
    setTimeout(() => {

    return res.status(200).json({
      success: true,
      data : productDetails
    })
  },1000);
})


app.get("/categories", (req, res) => {

  setTimeout(() => {
  return res.status(200).json({
    success: true,
    data: {
      categories: [
        { categoryId: 1, categoryName: "Shoes", categoryUrl: "shoes.png" },
        { categoryId: 2, categoryName: "Bags", categoryUrl: "bag.png" },
        { categoryId: 3, categoryName: "Jewellery", categoryUrl:"jewelery.png" }, 
        { categoryId: 4, categoryName: "Saree", categoryUrl: "saree.png" }, 
        { categoryId: 5, categoryName: "Dresses", categoryUrl: "dresses.png" }, 
        { categoryId: 6, categoryName: "Active Wear", categoryUrl: "activewear.png" }, 
        { categoryId: 7, categoryName: "Work Wear", categoryUrl: "workwear.png" },
        { categoryId: 8, categoryName: "Tops", categoryUrl: "tops.png" }]
    }
  })
},0);
});

app.get("/products", (req, res) => {
  let { page, limit } = req.query;
  console.log(limit, page);

  // Convert limit and page to integers
  limit = parseInt(limit);
  page = parseInt(page);

  // Set default values if limit or page are not provided or invalid
  if (isNaN(limit) || limit <= 0) {
    limit = 10; // default limit
  }
  if (isNaN(page) || page <= 0) {
    page = 1; // default page
  }

  // Calculate the start index
  const startIndex = (page - 1) * limit;
  const endIndex = startIndex + limit;

  // Get the limited products
  const limitedProducts = products.slice(startIndex, endIndex);
  setTimeout(()=>{

    return res.status(200).json({ success: true, data: limitedProducts });
  },3000)
 

});
app.post("/login",(req,res)=>{
  const {password,email} = req.body;
  console.log(req.body);
  if(password != "1234" || email != "a@b.com"){
    return res.status(401).json({
      message : "Error Wrong Creds!!!"
    });
    
  }
  
  return res.status(200).json({
    success:true,
    data : {token:121}
  });
});

app.get("/user",(req,res)=>{
  const user = {
    userId : 121,
    name : "Anshuman Sharma",
    email:"anshuman9998@gmail.com",
    profilePic : "https://cdn.pixabay.com/user/2020/10/31/08-13-03-665_250x250.jpg",
    wallet : {
      amount : 121.1,
      peopleRefered : 10,
      uniqueCode : "AX123C"
    }
  }
  const headers = req.headers;
  console.log(headers);
  const token = headers.authorization.split(" ")[1];
  if(token != user.userId){
    return res.status(401).json({success:false,message:"Unautorized"});
  }
  return res.status(200).json({
    success:true,
    data:user
  });



})

app.get("/trending", (req, res) => {
  console.log("fsdfsad");
  return res.status(200).json({
    success: true, data: [
      "40% off on Banarasi Saree",
      "50% off on Kurti",
      "60% off on Tops",
      "70% off on Silk Saree",
      "10% off on Everything",
      "20% off on Saree",
      "30% off on Jeans",
      "40% off on Boots",
      "40% off on Purse",
    ]
  });
})
app.get("/newin", (req, res) => {

  setTimeout(() => {
    return res.status(200).json({ success: true, data: products });
  }, 0);

})

app.get("/", (req, res) => {
  res.status(200).json({ msg: "Success server" });
});

app.post("/code", (req, res) => {
  console.log("heeeeeeeeeeeeeeeeelllllllllllllloooooooooooooooooo", req.body);
  if (req.body.code == "1234") {
    return res.status(200).json({ success: true });
  } else {
    return res.status(401).json({ success: false });
  }
});


app.post("/signup", (req, res) => {
  if (!req.body.fullName || !req.body.email || !req.body.password || !req.body.country) {
    return res.status(501).json({ success: false });
  }
  console.log(req.body);

  return res.status(200).json({ success: true });
})

app.post('/authenticate', async (req, res) => {
  const idToken = req.body.token;
  try {
    console.log("idddddddddddddddd", admin.auth());
    const decodedToken = await admin.auth().verifyIdToken(idToken);
    console.log("decoded", decodedToken);
    const uid = decodedToken.uid;

    // Access user information from the decodedToken
    console.log('User ID:', uid);
    console.log('Email:', decodedToken.email);
    console.log('Name:', decodedToken.name);

    // Respond with the decoded token or use it as needed
    res.status(200).send({ uid: uid, decodedToken: decodedToken });
  } catch (error) {
    console.log(error);
    res.status(400).send('Invalid ID token');
  }
});
(() => {
  app.listen(3000, () => {
    console.log("server started on port 3000");
  })
})()