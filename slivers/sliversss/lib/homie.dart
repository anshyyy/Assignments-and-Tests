// home_page.dart
import 'package:flutter/material.dart';
import 'package:sliversss/navi.dart';
import 'package:sliversss/target.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  int _currentIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  void _onTabTapped(int index, BuildContext context) {
    if (index == 1) {
      // Assuming index 1 is the tab for navigation
      RenderBox renderBox =
          _bottomNavigationKey.currentContext!.findRenderObject() as RenderBox;
      Offset position = renderBox.localToGlobal(Offset.zero);
      Size size = renderBox.size;
      double buttonWidth =
          size.width / 3; // Assuming 3 buttons in the bottom nav
      double buttonX = position.dx + (buttonWidth * index) + (buttonWidth / 2);
      double buttonY = position.dy + size.height / 2;

      Navigator.of(context).push(
        WaterFlowPageRoute(
          builder: (context) => TargetPage(),
          touchPosition: Offset(buttonX, buttonY),
        ),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(child: Text('Home Page Content')),
      bottomNavigationBar: BottomNavigationBar(
        key: _bottomNavigationKey,
        onTap: (index) => _onTabTapped(index, context),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Navigate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
