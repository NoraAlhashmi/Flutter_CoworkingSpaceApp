import 'package:falakapp/models/user.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            currentUser.imageUrl != null
                ? CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/Profile.png"),
                  )
                : CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/profileimg.png")),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  currentUser.name,
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.w600),
                ),
                currentUser.is_admin
                    ? Icon(
                        Icons.star_border,
                      )
                    : Text(''),
              ],
            ),
            Text(currentUser.career + ' in ' + currentUser.name)
          ],
        ),
      ),
    );
  }
}
