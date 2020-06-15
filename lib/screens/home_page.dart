import 'package:falakapp/screens/team_page.dart';
import 'package:falakapp/widgets/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'booking_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  homePageState createState() => homePageState();
}

class homePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String jwt = 'loading';

  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Color(0XFF24242c), Color(0XFF2e2e2e)],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            alignment: Alignment.topCenter,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/falak.png",
                    height: 60.0,
                    width: 60.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/profileimg.png")),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Hi Nora',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FlatButton(
                        onPressed: () {
                          logout();
                        },
                        child: Icon(
                          Icons.power_settings_new,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
          Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            child: Text(jwt),
          ),
          Positioned(
              right: 30,
              bottom: 30,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(270),
                        degOneTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degOneTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.deepPurple,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.work,
                          color: Colors.white,
                        ),
                        onClick: () {
                          //TODO: on click is not working
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => BookingScreen()));
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(225),
                        degTwoTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degTwoTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.amber,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.local_cafe,
                          color: Colors.white,
                        ),
                        onClick: () {},
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(180),
                        degThreeTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degThreeTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.indigo,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.warning,
                          color: Colors.white,
                        ),
                        onClick: () {},
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value)),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.black,
                      width: 60,
                      height: 60,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onClick: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => BookingScreen()));
                        if (animationController.isCompleted) {
                          animationController.reverse();
                        } else {
                          animationController.forward();
                        }
                      },
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
  }

  void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('jwt');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  void getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      jwt = sharedPreferences.get('jwt');
    });
  }
}
