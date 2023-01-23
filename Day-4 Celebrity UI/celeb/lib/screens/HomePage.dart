import 'package:celeb/screens/MakeVideo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        upperBound: 1);
    animation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutSine);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/emma.jpg"),
                      fit: BoxFit.cover,
                    )),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.black.withOpacity(.3)],
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Emma Watson",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: animation.value * 45),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text("60  Videos",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16)),
                                  SizedBox(width: 60),
                                  Text("240K Subscribers",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16))
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Emma Charlotte Duerre Watson is an English actress and activist. Known for her roles in both blockbusters and independent films, as well as for her women's rights work, she has received a selection of accolades, including a Young Artist Award and three MTV Movie Awards.",
                        style: TextStyle(color: Colors.grey, height: 1.4),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Born",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "April 15th 1990, Paris, France",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Nationality",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "British",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Videos",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              MakeVideo(image: "emma-1.jpg"),
                              MakeVideo(image: "emma-2.jpg"),
                              MakeVideo(image: "emma-3.jpg")
                            ]),
                      ),
                      SizedBox(
                        height: 150,
                      )
                    ],
                  ),
                )
              ]))
            ],
          ),
          Positioned.fill(
            bottom: 30,
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        Colors.yellowAccent.withOpacity(.9),
                        Colors.yellow.withOpacity(1),
                        Colors.orange.withOpacity(0.5),
                      ])),
                  child: Center(
                      child: Text(
                    "Follow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
