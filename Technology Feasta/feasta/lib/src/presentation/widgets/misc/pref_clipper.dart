import 'package:flutter/material.dart';

class PerforatedBorderClipper extends CustomClipper<Path> {
  final double holeRadius = 6;
  final double holeSpacing = 12;

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final Path holePath = Path();

    // Start from top-left corner
    path.moveTo(0, 0);
    path.lineTo(size.width, 0); // Top edge
    path.lineTo(size.width, size.height); // Right edge
    path.lineTo(0, size.height); // Bottom edge
    path.close();

    // Create holes on the left edge
    double holeCenterY = holeSpacing;
    while (holeCenterY < size.height) {
      holePath.addOval(
          Rect.fromCircle(center: Offset(0, holeCenterY), radius: holeRadius));
      holeCenterY += holeRadius * 2 + holeSpacing;
    }

    // Create holes on the right edge
    holeCenterY = holeSpacing;
    while (holeCenterY < size.height) {
      holePath.addOval(Rect.fromCircle(
          center: Offset(size.width, holeCenterY), radius: holeRadius));
      holeCenterY += holeRadius * 2 + holeSpacing;
    }

    return Path.combine(PathOperation.difference, path, holePath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
