import 'package:falakapp/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class LaunchScreen extends StatelessWidget {
  checkLoginStatus(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString("jwt") == null) {
      print("in launch page: jwt is null");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    } else {
      print("in launch page:" + sharedPreferences.getString("jwt"));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    checkLoginStatus(context);
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
        ]));
  }
}
