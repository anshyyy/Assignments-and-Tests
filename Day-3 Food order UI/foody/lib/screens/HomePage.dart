import 'package:flutter/material.dart';
import 'package:foody/screens/front_page.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation animation;
  late Image starter;

  bool _textVisible = true;

  @override
  void initState() {
    super.initState();
    starter = Image.asset("assets/images/starter-image.jpg");
    _animationController = AnimationController(
        duration: Duration(seconds: 3), vsync: this, upperBound: 1);

    animation =
        Tween<double>(begin: 0.0, end: 25.0).animate(_animationController);
    animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  void _onTap() {
    Navigator.push(
      context,
      PageTransition(
          alignment: Alignment.bottomCenter,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 600),
          reverseDuration: Duration(milliseconds: 600),
          type: PageTransitionType.bottomToTop,
          child: FrontPage(),
          childCurrent: HomePage()),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.4)
          ])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: animation.value * 200,
                  child: const Text(
                    "Taking Order For Delivery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "See restaurants nearby by \nadding location",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 80),
                MaterialButton(
                  onPressed: () {
                    _onTap();
                  },
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
