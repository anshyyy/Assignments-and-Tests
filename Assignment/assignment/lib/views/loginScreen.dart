import "package:assignment/views/homeScreen.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../constants/colors.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();

  final String pin = "1907";
  bool isCorrectPassword = true;

  bool checkPassword(String userEnteredPassword) {
    if (pin == userEnteredPassword) return true;
    return false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pin1.dispose();
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
  }

  void clearControllers() {
    pin1.clear();
    pin2.clear();
    pin3.clear();
    pin4.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: Container(
        margin: const EdgeInsets.only(top: 180, bottom: 10, right: 8, left: 8),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/grow.webp"),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Hi, Anshuman Sharma!",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "anshuman9998@gmail.com",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    //here logic for logout
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff15b590)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Verify 4-digit Password PIN",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 54,
                  child: TextFormField(
                    controller: pin1,
                    cursorColor: Color(0xff15b590),
                    obscureText: true,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff4c4b4b),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            color: isCorrectPassword
                                ? Color(0xff15b590)
                                : Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          color: isCorrectPassword
                              ? Color(0xff15b590)
                              : Colors.red,
                        ),
                      ),
                    ),
                    style: TextStyle(color: kgreen),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 70,
                  width: 54,
                  child: TextFormField(
                    controller: pin2,
                    cursorColor: Color(0xff15b590),
                    obscureText: true,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff4c4b4b),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            color: isCorrectPassword
                                ? Color(0xff15b590)
                                : Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          color: isCorrectPassword
                              ? Color(0xff15b590)
                              : Colors.red,
                        ),
                      ),
                    ),
                    style: TextStyle(color: kgreen),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 70,
                  width: 54,
                  child: TextFormField(
                    controller: pin3,
                    cursorColor: Color(0xff15b590),
                    obscureText: true,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff4c4b4b),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            color: isCorrectPassword
                                ? Color(0xff15b590)
                                : Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          color: isCorrectPassword
                              ? Color(0xff15b590)
                              : Colors.red,
                        ),
                      ),
                    ),
                    style: TextStyle(color: kgreen),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 70,
                  width: 54,
                  child: TextFormField(
                    controller: pin4,
                    cursorColor: Color(0xff15b590),
                    obscureText: true,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      String userEnteredPin =
                          pin1.text + pin2.text + pin3.text + pin4.text;
                      setState(() {
                        isCorrectPassword = checkPassword(userEnteredPin);
                      });
                      clearControllers();
                      if (isCorrectPassword) {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff4c4b4b),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 5,
                            color: isCorrectPassword
                                ? Color(0xff15b590)
                                : Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          color: isCorrectPassword
                              ? Color(0xff15b590)
                              : Colors.red,
                        ),
                      ),
                    ),
                    style: TextStyle(color: kgreen),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            isCorrectPassword
                ? Text("")
                : Text(
                    "Wrong PIN",
                    style: TextStyle(color: Colors.red),
                  )
          ],
        ),
      ),
    );
  }
}
