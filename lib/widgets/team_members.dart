import 'package:falakapp/models/user.dart';
import 'package:flutter/material.dart';

class TeamMembers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ns3a Recruitment' + ' team',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    currentUser.is_admin
                        ? IconButton(
                            icon: Icon(Icons.person_add),
                            iconSize: 30.0,
                            color: Colors.black,
                            onPressed: () {},
                          )
                        : SizedBox(
                            height: 50,
                          ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final User member = users[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage("assets/profileimg.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          member.name,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        member.is_admin
                                            ? Icon(
                                                Icons.star_border,
                                              )
                                            : Text('')
                                      ],
                                    ),
                                    Text(
                                      member.career,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.email),
                                  iconSize: 20.0,
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.phone),
                                  iconSize: 20.0,
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
