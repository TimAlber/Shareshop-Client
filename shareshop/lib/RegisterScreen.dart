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
  final logincontroller = TextEditingController();
  final addrescontroller = TextEditingController();
  final passwrdcontroller = TextEditingController();

  void _showDialog(String content) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Registration Error"),
        content: new Text(content),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


  void regmein() async {
    var client = new http.Client();

    final thedata = await client.get(
        'http://7nxhxgbamxfrbb4f.myfritz.net:9999/?msg=login&msg=' +
            logincontroller.text +
            '&msg=' +
            passwrdcontroller.text);

    if (thedata.statusCode == 200) {
      debugPrint(thedata.body);

      if (thedata.body == 'Login successfull') {
        debugPrint("drinne");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LogedinArea(username: logincontroller.text)),
        );
      } else {
        debugPrint("nicht drinne");
        _showDialog("Benutzername oder Passwort falsch.");
      }
    } else {
      debugPrint("Http Fehler");
      _showDialog("Internet oder Server Problem");
    }
  }

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
              controller: logincontroller,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Username'),
            ),
            new TextField(
              controller: addrescontroller,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Adress'),
            ),
            new TextField(
              controller: passwrdcontroller,
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