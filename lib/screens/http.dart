import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Http extends StatefulWidget {
  Http({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HttpState createState() => HttpState();
}

class HttpState extends State<Http> {
  List data;

  Future<String> getDataFromFalakAPI() async {
    http.Response response = await http
        .get(Uri.encodeFull("http://192.168.100.27:8080/hello"), headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJBZHdhQGZhbGFrLnNhIiwiZXhwIjoxNTg5ODAxNjE1LCJpYXQiOjE1ODk3NjkyMTV9.KARSvKeILBsx-zSAj1ZO3jy_5DCYcoDGQzpOxAoJN28"
    });
    print(response.body);
    return "Success!";
  }

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("192.168.100.27:8080/hello"),
        headers: {"Accept": "application/json"});
    print(response.body);
    data = json.decode(response.body);
    print(data[0]["title"]);

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("get data"),
          onPressed: getData,
        ),
      ),
    );
  }
}
