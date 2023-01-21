import 'package:flutter/material.dart';
import 'package:trip/url.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trip/widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  void _onScroll() {
    print('hello');
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

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
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          GestureDetector(
            onVerticalDragUpdate: (dragUpdateDetails) {
              _launchURL("www.google.com");
            },
            child: MakePage(
              index: 1,
              image: "one.jpg",
              rating: 4,
              title: "Yosemite National Park",
              description:
                  "Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome. In Yosemite Village are shops, restaurants, lodging, the Yosemite Museum and the Ansel Adams Gallery, with prints of the photographer’s renowned black-and-white landscapes of the area.",
            ),
          ),
          MakePage(
              index: 2,
              image: "three.jpg",
              rating: 4.5,
              title: "Sedona",
              description:
                  "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful. The towering red rocks and jagged sandstone buttes matched against an almost always blue sky have beckoned to professional and budding artists for years."),
          MakePage(
              index: 3,
              image: "two.jpg",
              rating: 3.5,
              title: "Golden Gate Park",
              description:
                  "Golden Gate Park, located in San Francisco, California, United States, is a large urban park consisting of 1,017 acres of public grounds. It is administered by the San Francisco Recreation & Parks Department, which began in 1871 to oversee the development of Golden Gate Park."),
          MakePage(
              index: 4,
              image: "four.jpg",
              rating: 3.5,
              title: "Savannah",
              description:
                  "Savannah is renowned for its beautiful, tree lined roads and avenues. They impart a majestic air to the area, and they are used by another species as a host. It is very common to see wispy, Spanish moss dangling from Savannah’s trees. Spanish moss is misnamed. It is neither Spanish or a moss. It originates from Latin America and is actually from the Bromeliaceae, or pineapple, family. Native Americans used to call the plant a name that translates as ‘tree hair’. They found many practical uses for this plant, from making ropes to coarse blankets for horses."),
        ],
      ),
    );
  }
}
