import 'package:flutter/material.dart';

void main() {
  runApp(
    FreindlyChatApp(),
  );
//
//  runApp(
//    Stacks(),
//  );
}

class FreindlyChatApp extends StatelessWidget {
  const FreindlyChatApp({
    Key key,
  }) : super(key: key);

  @override
  StatelessElement ChatScreen() {
    // TODO: implement createElement
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[600]),
      title: 'FriendlyChat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Covigatchi-Alpha'),
        ),
        body: Center(
            child: //Image(image: AssetImage('images/Logos/CovaGotchi.png'))

                Container(
          child: Image(
              image: AssetImage('images/Logos/GameboyIconFinal copy.png')),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffbcfda3),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xffbcfda3),
                offset: Offset(1.0, 6.0),
                blurRadius: 40.0,
              ),
            ],
          ),
          margin: EdgeInsets.all(40.0),
          padding: EdgeInsets.all(70.0),
        )),
        backgroundColor: Color(0xffa3bcfd),
      ), //Main
    );
  } //end of build

}

//
//class Stacks extends StatelessWidget {
//
//
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp (
//
//    @override
//    Widget build(BuildContext context) {
//      Stack(
//        fit: StackFit.expand,
//        children: <Widget>[Text('Covigatchi-Alpha'),Text('Covigatchi-Alpha'),Text('Covigatchi-Alpha'),Text('Covigatchi-Alpha')],
//
//
//      );
//
//    }
//
//    );
//  }}

class colorSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.red,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.purple,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

getSizes() {}

getPositions() {}
