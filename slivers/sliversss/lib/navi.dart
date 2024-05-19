// water_flow_page_route.dart
import 'package:flutter/material.dart';

class WaterFlowPageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  final Offset touchPosition;

  WaterFlowPageRoute({required this.builder, required this.touchPosition})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionDuration: Duration(seconds: 3),
          reverseTransitionDuration:
              Duration(seconds: 2), // Handle reverse transition duration
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Stack(
          children: [
            if (animation.value < 0.5)
              Positioned.fill(
                child: ClipPath(
                  clipper: WaterFlowClipper(animation.value * 2, touchPosition),
                  child: Container(color: Colors.blue),
                ),
              )
            else
              Positioned.fill(child: child as Widget),
          ],
        );
      },
      child: child,
    );
  }

  @override
  bool get opaque => false; // Ensures the underlying page is not hidden

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }
}

class WaterFlowClipper extends CustomClipper<Path> {
  final double progress;
  final Offset touchPosition;

  WaterFlowClipper(this.progress, this.touchPosition);

  @override
  Path getClip(Size size) {
    final path = Path();
    final maxRadius = size.height * 1.5; // Adjust based on desired effect

    path.addOval(Rect.fromCircle(
      center: touchPosition,
      radius: maxRadius * progress,
    ));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
