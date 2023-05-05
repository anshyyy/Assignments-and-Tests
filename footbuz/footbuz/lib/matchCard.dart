import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:swipable_stack/swipable_stack.dart';

class MatchCard extends StatefulWidget {
  final List color;
  final List matches;
  MatchCard({super.key, required this.color, required this.matches});

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  var logos = [
    "assets/logos/team1.png",
    "assets/logos/team2.jpeg",
    "assets/logos/team3.jpeg",
    "assets/logos/team4.png",
    "assets/logos/team5.jpeg",
    "assets/logos/team6.png",
  ];
  late SwipableStackController _controller = new SwipableStackController();

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
    return SwipableStack(
      detectableSwipeDirections: const {
        SwipeDirection.right,
        SwipeDirection.left,
      },
      controller: _controller,
      stackClipBehaviour: Clip.antiAlias,
      onSwipeCompleted: (index, direction) {
        if (kDebugMode) {
          print("Hello");
          print('$index, $direction');
        }
      },
      horizontalSwipeThreshold: 0.8,
      verticalSwipeThreshold: 0.8,
      builder: (context, properties) {
        var match = widget.matches[properties.index % widget.matches.length];
        return Stack(
          children: [
            Container(
              height: 170,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                child:
                                    Image.asset(logos[properties.index % 6])),
                            const SizedBox(width: 20),
                            Text(
                              match.keys.toList()[0],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(width: 40),
                            Text(
                              match.values.toList()[0].toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                child: Image.asset(
                                    logos[(properties.index + 1) % 6])),
                            const SizedBox(width: 20),
                            Text(
                              match.keys.toList()[1],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(width: 40),
                            Text(
                              match.values.toList()[1].toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            )
          ],
        );
      },
    );
  }
}
