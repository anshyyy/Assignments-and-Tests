import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:footbuz/matchCard.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late SwipableStackController _controller = SwipableStackController();

  var matches = [
    {
      "Liverpool Football": 3,
      "Manchester United": 0,
    },
    {
      "Argentina Football": 3,
      "Patna Kings": 1,
    },
    {
      "Ranchi Football club": 0,
      "Kolkata Football Union": 3,
    }
  ];

  var colors = [Colors.yellow, Colors.green, Colors.blue, Colors.black];

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            height: 400,
            padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.redAccent,
                border: Border.all(
                  color: Colors.red,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Text(
                        "Footbuzz",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            child: Center(
                              child: Icon(color: Colors.red, Icons.search),
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 45,
                            width: 45,
                            child: const Center(
                              child:
                                  Icon(color: Colors.red, Icons.calendar_month),
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text("Live Match",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Container(
                  height: 200,
                  width: 500,
                  child: MatchCard(
                    color: colors,
                    matches: matches,
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
