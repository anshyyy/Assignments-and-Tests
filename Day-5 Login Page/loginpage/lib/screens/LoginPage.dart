import 'package:flutter/material.dart';
import 'package:loginpage/screens/FirstPage.dart';
import 'package:loginpage/screens/SignUpPage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  bool _passwordVisible = false;
  bool _obscureText = true;
  bool wrongCreds = false;

  Future<bool> _checkPassword(String email, String password) async {
    String url = "http://192.168.29.24:3009/api/v1/signin";
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: {'email': email, 'password': password});
      if (response.statusCode == 201) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => FirstPage())));
      } else {
        setState(() {
          wrongCreds = true;
          _password.clear();
        });
      }
    } catch (err) {
      print(err);
      throw err;
    }

    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    _obscureText = true;
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Login to your account",
                    style: TextStyle(color: Colors.grey[700], fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
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
                          hintText: "Enter Your Pasword",
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
                    print(_password.text);
                    print(_email.text);
                    _checkPassword(_email.text, _password.text);
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text("Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover)),
            )
          ],
        ),
      ),
    );
  }
}
