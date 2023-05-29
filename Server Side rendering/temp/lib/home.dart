import 'package:flutter/material.dart';
import 'package:temp/remote_config.dart';
import 'package:temp/serverData.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> serverWidgets = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVal();
  }

  getVal() async {
    print("hello data is loading");
    var serverJsonList = await FirebaseRemoteConfigclass().initializeConfig();
    print(serverJsonList);
    setState(() {
      serverWidgets = MapWidgetToWidget().mapWidgets(serverJsonList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server Side Rendering"),
        backgroundColor: Colors.teal[900],
      ),

      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Column(
              children: [...serverWidgets],
            )),
      ),
    );
  }
}
