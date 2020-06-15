import 'package:falakapp/hex_color.dart';
import 'package:falakapp/screens/launch_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//The theme: nav bar
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Falak',
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: HexColor('#F2EFE7'),
          buttonColor: Color(0XFF263238),
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary)),
      home: LaunchScreen(),
    );
  }
}
