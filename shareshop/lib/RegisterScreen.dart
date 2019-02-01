import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'dart:async';
import 'main.dart';

class RegisterSceen extends StatefulWidget {
  RegisterSceen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<RegisterSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            new TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Username'),
            ),
            new TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Adress'),
            ),
            new TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Password'),
            ),
            new RaisedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
              },
              child: Text("Register me!"),
            ),
          ],
        ),
      ),
    );
  }
}