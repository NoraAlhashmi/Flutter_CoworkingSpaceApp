import 'dart:convert';

import 'package:falakapp/animations/animation.dart';
import 'package:falakapp/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

//The page title
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String email;
  String password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> initState() {
    checkLoginStatus();
  }

  Widget buildEmailField() {
    return TextFormField(
      initialValue: 'eve.holt@reqres.in',
      style: TextStyle(color: Colors.white70),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(
          Icons.email,
          size: 15,
          color: Colors.white70,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 1)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
      ),
      validator: (String value) {
        if (value.isEmpty) return 'email required';
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Invalid email';
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      initialValue: 'cityslicka',
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(color: Colors.white70),
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(
          Icons.lock,
          size: 15,
          color: Colors.white70,
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 1)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
      ),
      validator: (String value) {
        if (value.isEmpty) return 'password required';
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: <Widget>[
          Image.asset(
            'assets/FalakBackground.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [
                  Color(0XFF24242c).withOpacity(0.5),
                  Color(0XFF2e2e2e).withOpacity(0.5)
                ],
              ),
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeAnimation(
                  0.3,
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 40,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4),
                  ),
                ),
                FadeAnimation(
                  0.6,
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'We promise to help you having the most productive time with us.',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          color: Theme.of(context).accentColor.withOpacity(0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          height: 1.5),
                    ),
                  ),
                ),
                !isLoading
                    ? FadeAnimation(
                        1,
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.all(5),
                                    child: buildEmailField()),
                                Container(
                                    margin: EdgeInsets.all(5),
                                    child: buildPasswordField()),
                                Container(
                                    margin: EdgeInsets.all(5),
                                    child: RaisedButton(
                                      color: HexColor('#E1B324'),
                                      child: Container(
                                          width: size.width,
                                          height: 50,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'LOGIN',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      onPressed: () {
                                        if (!formKey.currentState.validate()) {
                                          print('invalid');
                                          return;
                                        } else {
                                          isLoading = true;
                                          formKey.currentState.save();
                                          login();
                                        }
                                      },
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(100),
                        child: CircularProgressIndicator())
              ],
            ),
          )
        ]));
  }

  void login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    var jsonData = null;
    http.Response response = await http.post(
        Uri.encodeFull("https://reqres.in/api/login"),
        headers: {"Accept": "application/json"},
        body: data);

    if (response != null && response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        isLoading = false;
        sharedPreferences.setString('jwt', jsonData['token']);
        print(sharedPreferences.get('jwt'));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route<dynamic> route) => false);
      });
    } else {
      print('invalid response: ' + response.body);
    }
    isLoading = false;
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("jwt") == null) {
      print("in login page: jwt is null");
    } else {
      print("in login page:" + sharedPreferences.getString("jwt"));
    }
  }
}
