import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LogedinArea.dart';
import 'main.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginScreen> {
  final logincontroller = TextEditingController();
  final passwrdcontroller = TextEditingController();

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
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

  void logmein() async {
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
        _showDialog();
      }
    } else {
      debugPrint("Http Fehler");
      _showDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            new TextField(
              controller: logincontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please enter your Username'),
            ),
            new TextField(
              controller: passwrdcontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please enter your Password'),
            ),
            new RaisedButton(
              onPressed: logmein,
              child: Text("Log me in!"),
            ),
          ],
        ),
      ),
    );
  }
}

/*


    final thedata = await client.get(
        'http://7nxhxgbamxfrbb4f.myfritz.net:9999/?msg=login&msg=' +
            logincontroller.text +
            '&msg=' +
            passwrdcontroller.text);
    debugPrint(thedata.body);

*/
