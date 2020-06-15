import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  Inbox({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              decoration: BoxDecoration(
                  color: Color(0XFF263238),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  )),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 70.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Ns3a Recruitment",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "New age of recruitment",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            )
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        height: 70.0,
                        width: 300.0,
                      ),
                      Positioned(
                        bottom: 10.0,
                        child: Container(
                          height: 95.0,
                          width: 350.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                      "assets/profileimg.png",
                                      height: 60.0,
                                      width: 60.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Nora Alhashmi",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                        ),
                                        Text(
                                          "Product Owner",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.0),
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Spacer(),
                                            Icon(
                                              Icons.email,
                                              color: Colors.orange,
                                              size: 20.0,
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Icon(
                                              Icons.phone,
                                              color: Colors.orange,
                                              size: 20.0,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "TEAM",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "(4 members)",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 95.0,
              width: 350.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          "assets/Profile.png",
                          height: 60.0,
                          width: 60.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "Protorix Code",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                Spacer(),
                                Text(
                                  "8:16 AM",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ],
                            ),
                            Text(
                              "Your opinion matters",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "You have a mail. Check it!",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.0),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.orange,
                                  size: 20.0,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 95.0,
              width: 350.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset(
                          "assets/Profile.png",
                          height: 60.0,
                          width: 60.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "Protorix Code",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                Spacer(),
                                Text(
                                  "8:16 AM",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ],
                            ),
                            Text(
                              "Your opinion matters",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "You have a mail. Check it!",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.0),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.orange,
                                  size: 20.0,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
