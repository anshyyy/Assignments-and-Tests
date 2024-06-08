import 'package:feasta/src/presentation/widgets/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  List<String> names = [
    "Anuv Jain",
    "Mike Tyson",
    "HardWell",
    "Shreya Goshal",
    "Mohit Chahuhan"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.black,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 400,
        itemHeight: 225,
        loop: true,
        duration: 1200,
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return TicketCard(
            name: names[index],
            index: index,
          );
        },
      ),
    );
  }
}
