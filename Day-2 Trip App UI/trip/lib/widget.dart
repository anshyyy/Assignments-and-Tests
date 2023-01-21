import 'package:flutter/material.dart';
import 'package:trip/fadeAnimation.dart';
import 'package:trip/star.dart';
import 'package:url_launcher/url_launcher.dart';

class MakePage extends StatelessWidget {
  String image;
  String title;
  String description;
  double rating;
  int index = 1;
  MakePage(
      {Key? key,
      required this.description,
      required this.title,
      required this.index,
      required this.rating,
      required this.image})
      : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
            headers: <String, String>{'my_header_key': 'my_header_value'}),
      );
    } catch (e) {
      throw "cannot open it";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/" + image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2)
        ])),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "${index}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "/4",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                      child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      StarRating(
                        starCount: 5,
                        rating: rating,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 10),
                      Text(
                        rating.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '(2300)',
                        style: TextStyle(color: Colors.white38, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      description,
                      style: TextStyle(color: Colors.white60),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (() async {
                      print("nkjnkjb");
                      _launchURL("www.google.com");
                    }),
                    child: Text(
                      "READ MORE",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
