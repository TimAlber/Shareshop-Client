import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'dart:async';

class LogedinArea extends StatelessWidget {
  final String username;
  LogedinArea({Key key, @required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The DB"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              username,
              style: TextStyle(fontSize: 24),
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back!"),
            ),
          ],
        ),
      ),
    );
  }
}
