import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Container with sprite goes here

    //

    Color color = Theme.of(context).primaryColor;

    Widget test = Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
        height: 200,
        width: 240,
        child: ButtonBarTheme(
          data: ButtonBarThemeData(
            alignment: MainAxisAlignment.spaceEvenly,
            buttonHeight: 30,
            buttonMinWidth: 50,
          ),
          child: ButtonBar(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text("Action"),
                color: Colors.redAccent,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Items"),
                color: Colors.lime,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Store"),
                color: Colors.cyan,
              )
            ],
          ),
        ));

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Image.asset(
              'images/Logos/Tamagotchi_singiel.jpg',
              fit: BoxFit.cover,
            ),
            test,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
