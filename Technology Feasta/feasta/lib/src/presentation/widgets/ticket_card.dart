import 'package:feasta/src/constants/color.dart';
import 'package:feasta/src/presentation/widgets/misc/pref_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketCard extends StatelessWidget {
  int index;
  TicketCard({super.key, required this.index, required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: PerforatedBorderClipper(),
        child: Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: AppColors.ticketColors[index])),
          child: Stack(
            children: [
              Positioned(
                  top: -25,
                  left: 160,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                  )),
              Positioned(
                  bottom: -25,
                  left: 160,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                  )),
              const Positioned(
                  top: 5,
                  right: 10,
                  child: Text(
                    "W84375GB837845G8",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
              Positioned(
                  top: 30,
                  left: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        "India Tour 2023",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white38),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: Colors.white,
                          ),
                          Text(
                            " 03-04-2023, 11:00am - 2:00pm",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: Colors.white,
                          ),
                          Text(
                            " Mumbai Stadium, Mumbai, India",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )),
              Positioned(
                  bottom: 35,
                  left: 20,
                  child: Container(
                      child:
                          Image(image: AssetImage("assets/images/bar.png")))),
              Positioned(
                  top: 10,
                  left: 20,
                  child: Container(
                    width: 102,
                    height: 102,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 2, color: Colors.white.withOpacity(0.2)),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/image${index + 1}.png"))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
