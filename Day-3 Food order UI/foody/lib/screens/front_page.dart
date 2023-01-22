import 'package:flutter/material.dart';
import 'package:foody/screens/MakeItem.dart';
import 'package:foody/screens/make_category.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_basket, color: Colors.grey[800]))
          ],
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Food Delivery",
                      style: TextStyle(
                          color: Colors.grey[80],
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          MakeCategory(title: "Pizza", isActive: true),
                          MakeCategory(title: "Shake", isActive: false),
                          MakeCategory(title: "Biryani", isActive: false),
                          MakeCategory(title: "Desert", isActive: false),
                          MakeCategory(title: "Burgers", isActive: false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Free Delivery",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  MakeItem(
                    name: "Vegetarian Pizza",
                    image: "one.jpeg",
                    price: "25",
                  ),
                  MakeItem(
                    name: "Cheese Mix Pizza",
                    price: "20",
                    image: "two.jpeg",
                  ),
                  MakeItem(
                    name: "Non-Veg Chicken Pizza",
                    price: "30",
                    image: "three.jpeg",
                  )
                ],
              ),
            )),
            SizedBox(height: 40),
          ],
        )));
  }
}
