import 'package:flutter/material.dart';

class TargetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Target Page')),
      body: Center(child: Text('This is the target page')),
    );
  }
}
