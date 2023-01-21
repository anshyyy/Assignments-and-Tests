import 'package:flutter/material.dart';

class makePage extends StatelessWidget {
  String image;
  makePage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/img/" + image), fit: BoxFit.cover),
      ),
    );
  }
}
