import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'dart:async';

class LogedinArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The DB"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}