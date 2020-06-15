import 'package:falakapp/screens/profile_page.dart';
import 'package:falakapp/widgets/team_members.dart';
import 'package:falakapp/widgets/user_details.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        elevation: 0, //shadow
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Inbox()));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[UserDetails(), TeamMembers()],
      ),
    );
  }
}
