import 'package:assignment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //url
  var url = Uri.parse("https://api.mfapi.in/mf/119063");

  late Map<String, dynamic> dataFromApi = {};
  late List<dynamic> dataList;

  void fetchData() async {
    var response = await http.get(url);
    // print(response.statusCode);
    //delaying for 2 seconds so that the data will be loaded successfully
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      //checking the response
      if (response.statusCode / 100 == 2) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        dataFromApi = jsonResponse;
        dataList = dataFromApi['data'];
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("main run hua hu1");
    //fetching the data when the home state will be build for the first time
    fetchData();
    // print("main run hua hu2");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //
      child: Scaffold(
          backgroundColor: kblack,
          body: dataFromApi.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: kgreen,
                  ),
                )
              : Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 100, bottom: 5),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(dataFromApi['meta']["fund_house"],
                                    style:
                                        TextStyle(color: kgreen, fontSize: 20)),
                                Text(dataFromApi['meta']["scheme_type"],
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 12)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Category:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: kgreen,
                                            fontSize: 12)),
                                    const SizedBox(width: 10),
                                    Text(dataFromApi['meta']["scheme_category"],
                                        style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 12))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Scheme Name:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: kgreen,
                                            fontSize: 12)),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 200,
                                      child: Text(
                                          dataFromApi['meta']["scheme_name"],
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 12)),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                    dataFromApi['meta']["scheme_code"]
                                        .toString(),
                                    style:
                                        TextStyle(color: kgreen, fontSize: 20)),
                              ],
                            )
                          ],
                        )),
                    const SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.4,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      child: ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              dataList[index]['date'],
                              style: TextStyle(color: Colors.white70),
                            ),
                            trailing: Text(
                              dataList[index]['nav'],
                              style: TextStyle(color: kgreen),
                            ),
                            // Add other widgets or customizations as needed
                          );
                        },
                      ),
                    ),
                  ],
                )),
      onWillPop: () async {
        // this will help us to exit the app
        SystemNavigator.pop();
        return true;
      },
    );
  }
}
