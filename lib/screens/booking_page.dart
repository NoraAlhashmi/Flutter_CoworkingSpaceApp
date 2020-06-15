import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  BookingScreenState createState() => BookingScreenState();
}

class BookingScreenState extends State<BookingScreen> {
  var selectedDate = '13';
  var selectedTime = '';
  var selectedEndTime = '';
  var selectedRoom = 'small_planet';
  double hours = 1;
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Make a Booking',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        elevation: 0.0, //shadow
      ),
      body: ListView(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 9.0,
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2.0),
              ]),
            ),
            Positioned(
              top: 20.0,
              left: 0,
              right: 0,
              child: Container(
                height: 60.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(width: 15),
                    dateWidget('13', 'Today'),
                    dateWidget('14', 'Fri'),
                    dateWidget('15', 'Sat'),
                    dateWidget('16', 'Sun'),
                    dateWidget('17', 'Mon'),
                    dateWidget('18', 'Tue'),
                    dateWidget('19', 'Wed'),
                    dateWidget('20', 'Thu'),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                'Select room',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              )),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                roomWidget('small.png', 'Small Planet'),
                roomWidget('large.png', 'Large Planet'),
                roomWidget('executive.png', 'Executive'),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                left: 15,
                bottom: 5,
              ),
              child: Text(
                'Available time slots',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              )),
          Container(
            height: 50.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: 15.0),
                timeWidget('11:30 am'),
                timeWidget('12:00 pm'),
                timeWidget('12:30 pm'),
                timeWidget('1:00 pm'),
                timeWidget('1:30 pm'),
                timeWidget('3:00 pm'),
                timeWidget('3:30 pm'),
                SizedBox(width: 15.0)
              ],
            ),
          ),
          selectedTime != ''
              ? Container(
                  margin: EdgeInsets.only(left: 15, bottom: 5, top: 15),
                  child: Text(
                    'To',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ))
              : SizedBox(),
          selectedTime != ''
              ? Container(
                  height: 50.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: 15.0),
                      endTimeWidget('12:30 pm'),
                      endTimeWidget('1:00 pm'),
                      endTimeWidget('1:30 pm'),
                      SizedBox(width: 15.0)
                    ],
                  ),
                )
              : SizedBox(),
          Container(
              margin: EdgeInsets.only(left: 15, bottom: 5, top: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  TextField(
                    maxLength: 30,
                  )
                ],
              )),
          SizedBox(height: 50.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(15),
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black),
                child: Center(
                  child: Text(
                    'BOOK',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dateWidget(String date, String day) {
    return AnimatedContainer(
        margin: EdgeInsets.only(right: 10, left: 10),
        width: 60,
        height: 60,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: switchColor(date),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: InkWell(
          onTap: () {
            selectDate(date, day);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  date.toString(),
                  style:
                      TextStyle(color: switchContentColor(date), fontSize: 20),
                ),
                Text(
                  day.toString(),
                  style:
                      TextStyle(color: switchContentColor(date), fontSize: 12),
                )
              ],
            ),
          ),
        ));
  }

  selectDate(String date, String day) {
    setState(() {
      selectedDate = date;
    });
  }

  Color switchColor(String date) {
    if (date == selectedDate)
      return Colors.black.withOpacity(0.8);
    else
      return Colors.grey.withOpacity(0.2);
  }

  Color switchContentColor(String date) {
    if (date == selectedDate)
      return Colors.white;
    else
      return Colors.black;
  }

  Widget roomWidget(String imgPath, String name) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 110,
              width: 110.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('assets/' + imgPath),
                      fit: BoxFit.cover)),
            ),
            InkWell(
              onTap: () {
                selectRoom(name);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 110.0,
                width: 110.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: getSelectedRoom(name)),
              ),
            )
          ],
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600),
        ),
        name == 'Small Planet'
            ? Text(
                '3 hours credits',
                style: TextStyle(fontSize: 15.0, color: Colors.green),
              )
            : Text(
                'No credits',
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              )
      ],
    );
  }

  selectRoom(name) {
    setState(() {
      selectedRoom = name;
    });
  }

  Color getSelectedRoom(name) {
    if (name == selectedRoom) {
      return Colors.amber.withOpacity(0.3);
    } else {
      return Colors.transparent;
    }
  }

  Color switchTimeColor(time) {
    if (time == selectedTime) {
      return Colors.indigo.withOpacity(0.8);
    } else {
      return Colors.grey.withOpacity(0.2);
    }
  }

  Color switchTimeContentColor(time) {
    if (time == selectedTime) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  selectTime(time) {
    setState(() {
      selectedTime = time;
    });
  }

  Widget timeWidget(time) {
    return AnimatedContainer(
      margin: EdgeInsets.all(5),
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: switchTimeColor(time)),
      height: 50.0,
      width: 100.0,
      child: InkWell(
        onTap: () {
          selectTime(time);
        },
        child: Center(
          child: Text(
            time,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: switchTimeContentColor(time)),
          ),
        ),
      ),
    );
  }

  Color switchEndTimeColor(time) {
    if (time == selectedEndTime) {
      return Colors.indigo.withOpacity(0.8);
    } else {
      return Colors.grey.withOpacity(0.2);
    }
  }

  Color switchEndTimeContentColor(time) {
    if (time == selectedEndTime) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  selectEndTime(time) {
    setState(() {
      selectedEndTime = time;
    });
  }

  Widget endTimeWidget(time) {
    return AnimatedContainer(
      margin: EdgeInsets.all(5),
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: switchEndTimeColor(time)),
      height: 50.0,
      width: 100.0,
      child: InkWell(
        onTap: () {
          selectEndTime(time);
        },
        child: Center(
          child: Text(
            time,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: switchEndTimeContentColor(time)),
          ),
        ),
      ),
    );
  }
}
