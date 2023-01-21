import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final Widget child;

  FadeAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<Color?>(
      tween: ColorTween(begin: Colors.red, end: Colors.blue), // define tween
      duration: const Duration(seconds: 5), // define duration
      builder: (context, value, _) {
        return child;
      },
    );
  }
}
