import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'central_game.dart';
//import 'math.dart';

class MathTest extends StatefulWidget {
  @override
  _MathTestState createState() => new _MathTestState();
}

class _MathTestState extends State<MathTest> {
  //final logic = Math();
  TextEditingController _c;
  double _hp = 100;
  double _food = 100;
  double _talk = 100;
  var _rng = new Random();
//  Timer decrementor;

  double decrement(double stat) {
    var num = _rng.nextInt(10);
    return stat -= num;
  }

  double increment(double stat) {
    var num = _rng.nextInt(10);
    return stat += num;
  }

  @override
  void initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
//    decrementor = new Timer.periodic(Duration(seconds: 10), (timer) {
//    downHealth();
//    downHunger();
//    downSocial();
//    print(this.toString());
//    });

    return new Scaffold(
      backgroundColor: _theme.primaryColor,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ButtonBar(
              buttonMinWidth: 20,
              buttonHeight: 20,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _hp = increment(_hp);
                      _food = decrement(_food);
                      _talk = decrement(_talk);
                    });
                  },
                  child: Text("Meds"),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _hp = decrement(_hp);
                      _food = increment(_food);
                      _talk = decrement(_talk);
                    });
                  },
                  child: Text("Munchies"),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _hp = decrement(_hp);
                      _food = decrement(_food);
                      _talk = increment(_talk);
                    });
                  },
                  child: Text("Masks"),
                ),
                new Text("Health: $_hp"),
                new Text("Hunger: $_food"),
                new Text("Social Life: $_talk")
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
