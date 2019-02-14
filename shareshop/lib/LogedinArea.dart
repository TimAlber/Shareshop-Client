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
  List shoppingliste;
  List<dynamic> shopliste;
  void getshoplist() async {
    var client = new http.Client();
    final thedata = await client.get(
        'http://7nxhxgbamxfrbb4f.myfritz.net:9999/?msg=getliste&msg=' +
            username);
    debugPrint(thedata.body);
    setState(() => shoplist = thedata.body);
    setState(() => shoppingliste = shoplist.split('|'));
    debugPrint(shoppingliste.toString());
  }

    void putshoplist() async {
    String putstr = "";
    for (var i = 0; i < shopliste.length; i++) {
      putstr = putstr+shopliste[i]+'|';
    }
    debugPrint(putstr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("The DB"),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
          itemCount: shoppingliste.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text('${shoppingliste[index]}'),
                trailing: new Icon(
                  // Add the lines from here...
                  Icons.delete,
                  color: Colors.red,
                ),
                onTap: () {
                  // Add 9 lines from here...
                  setState(() => shoppingliste.remove(shoppingliste[index]));
                });
          },
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              onPressed: () {},
              mini: true,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                  putshoplist();

              },
              icon: Icon(Icons.save),
              label: Text("Save"),
            ),
          ],
        ));
  }
}
