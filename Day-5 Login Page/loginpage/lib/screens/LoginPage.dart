import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loginpage/screens/widgets/Input.dart';
import 'package:loginpage/screens/widgets/PasswordInput.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.grey[800],
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 20),
                Text(
                  "Login to your account",
                  style: TextStyle(color: Colors.grey[700], fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  PlainInput(
                    label: "Email",
                    hintText: "Enter your Email",
                  ),
                  const SizedBox(height: 20),
                  MakeInput(
                      label: "Password",
                      hintText: "Enter your Password",
                      ObscureText: true)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: EdgeInsets.only(top: 3, left: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  height: 60,
                  color: Colors.yellow,
                  elevation: 0,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
