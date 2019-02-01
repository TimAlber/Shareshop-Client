import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'LoginScreen.dart';
import 'dart:async';

class LogedinArea extends StatefulWidget {
  final String username;
  LogedinArea({Key key, @required this.username}) : super(key: key);

  @override
  _MyLogedinPageState createState() => _MyLogedinPageState(username: username);
}

class _MyLogedinPageState extends State<LogedinArea> {
  final String username;
  _MyLogedinPageState({Key key, @required this.username});

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getshoplist());
  }

  String shoplist = "";
  void getshoplist() async {
    var client = new http.Client();
    final thedata = await client.get(
        'http://7nxhxgbamxfrbb4f.myfritz.net:9999/?msg=getliste&msg=' +
            username);
    debugPrint(thedata.body);
    List<dynamic> shopliste = jsonDecode(thedata.body);
    setState(() => shoplist = shopliste.toString());
  }

  Widget getTextWidgets(List<String> strings) {
    return new Row(children: strings.map((item) => new Text(item)).toList());
  }

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
            Text(
              shoplist,
              style: TextStyle(fontSize: 24),
            ),
            getTextWidgets(users)
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
