import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/starter-image.jpg"),
          fit: BoxFit.cover,
        )),
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.1)
          ])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Taking Order For Delivery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  "See restaurants nearby by \nadding location",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 80),
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(colors: [
                          Colors.yellowAccent.withOpacity(.9),
                          Colors.yellow.withOpacity(1),
                          Colors.orange.withOpacity(0.5),
                        ])),
                    child: Center(
                        child: Text(
                      "Start",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                    child: Text(
                  "Now Deliver To Your Door 24/7",
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
