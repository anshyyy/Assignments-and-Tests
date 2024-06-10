import 'package:feasta/src/constants/color.dart';
import 'package:feasta/src/presentation/screens/location_screen.dart';
import 'package:feasta/src/presentation/screens/ticket_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      LocationScreen(),
      const Center(
          child: Text("Person Screen", style: TextStyle(color: Colors.white))),
      const TicketScreen(),
      const Center(
          child: Text(
        "Profile Screen",
        style: TextStyle(color: Colors.white),
      )),
    ];

    return Scaffold(
      backgroundColor: AppColors.tabBackColor,
      bottomNavigationBar: Container(
        height: 80,
        color: const Color(0xff171717).withOpacity(0.4),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 26, right: 26),
            height: 44,
            decoration: BoxDecoration(
                color: AppColors.tabInActiveColor,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIcon(Icons.home, 0),
                  _buildIcon(Icons.people, 1),
                  _buildIcon(Icons.airplane_ticket, 2),
                  _buildIcon(Icons.person, 3),
                ]),
          ),
        ),
      ),
      body: screens[index],
    );
  }

  Widget _buildIcon(IconData icon, int idx) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            index = idx;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: index == idx ? Colors.pink : Colors.grey,
            ),
            if (index == idx)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color: Colors.pink,
              ),
          ],
        ),
      ),
    );
  }
}
