import 'package:flutter/material.dart';
import 'package:feasta/src/constants/color.dart';
import 'package:feasta/src/presentation/screens/pages/history_page.dart';
import 'package:feasta/src/presentation/screens/pages/upcoming_page.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  bool isUpcomingSelected = true;

  void toggleTab() {
    setState(() {
      isUpcomingSelected = !isUpcomingSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tabBackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              const Text(
                "Your Tickets",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!isUpcomingSelected) toggleTab();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: isUpcomingSelected
                            ? LinearGradient(colors: AppColors.tabActiveColor)
                            : LinearGradient(colors: [
                                AppColors.tabInActiveColor,
                                AppColors.tabInActiveColor
                              ]),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isUpcomingSelected
                                ? Colors.white
                                : Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      if (isUpcomingSelected) toggleTab();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: isUpcomingSelected
                            ? LinearGradient(colors: [
                                AppColors.tabInActiveColor,
                                AppColors.tabInActiveColor
                              ])
                            : LinearGradient(colors: AppColors.tabActiveColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: Text(
                        "History",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                              !isUpcomingSelected ? Colors.white : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: isUpcomingSelected ? UpcomingPage() : HistoryPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
