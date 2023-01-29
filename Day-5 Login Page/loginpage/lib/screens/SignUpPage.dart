import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:loginpage/screens/LoginPage.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _passwordVisible = false;
  bool _obscureText = true;
  bool wrongCreds = false;
  String hintText = "Enter Your Password";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _obscureText = true;
  }

  Future<bool> _register(String name, String email, String password) async {
    String url = "http://192.168.29.24:3009/api/v1/signUp";
    try {
      http.Response response = await http.post(Uri.parse(url),
          body: {'name': name, 'email': email, 'password': password});
      if (response.statusCode == 201) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => LoginPage())));
      } else {
        setState(() {
          wrongCreds = true;
          _password.clear();
          _confirmPassword.clear();
          _email.clear();
        });
      }
    } catch (err) {
      print(err);
      throw err;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 10,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "SignUp to your account",
                    style: TextStyle(color: Colors.grey[700], fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: _name,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "Enter your Name",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: _email,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: !wrongCreds ? Colors.grey : Colors.red),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _password,
                          keyboardType: TextInputType.text,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: TextStyle(
                                color:
                                    wrongCreds ? Colors.red : Colors.grey[700]),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: !wrongCreds ? Colors.grey : Colors.red,
                              ),
                              onPressed: (() {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                  _obscureText = !_obscureText;
                                });
                              }),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:
                                        wrongCreds ? Colors.grey : Colors.red)),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: !wrongCreds ? Colors.grey : Colors.red),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _confirmPassword,
                          keyboardType: TextInputType.text,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: TextStyle(
                                color:
                                    wrongCreds ? Colors.red : Colors.grey[700]),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: !wrongCreds ? Colors.grey : Colors.red,
                              ),
                              onPressed: (() {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                  _obscureText = !_obscureText;
                                });
                              }),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:
                                        wrongCreds ? Colors.grey : Colors.red)),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
                      String email = _email.text;
                      String name = _name.text;
                      String password = _password.text;
                      String cPassword = _confirmPassword.text;
                      print({email, name, password, cPassword});
                      if (password != cPassword) {
                        setState(() {
                          wrongCreds = true;
                          _password.clear();
                          _confirmPassword.clear();
                          hintText = "Passwords didnot Matched...Try Again ";
                        });
                      } else {
                        if (_register(name, email, password) == true) {
                          AlertDialog(
                            title: Text('Welcome'),
                            content: Text('GeeksforGeeks'),
                            actions: [
                              InkWell(
                                onTap: () {},
                                child: Text('CANCEL',
                                    style: TextStyle(color: Colors.black)),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Approve',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
                          );
                        }
                      }
                    },
                    height: 60,
                    color: Colors.greenAccent,
                    elevation: 0,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "SignUp",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text("Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                    )
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
