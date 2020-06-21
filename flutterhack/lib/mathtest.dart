import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'central_game.dart';

class MathTest extends StatefulWidget {
  @override
  _MathTestState createState() => new _MathTestState();
}

class _MathTestState extends State<MathTest> {
  TextEditingController _c;
  double _hp = 100;
  double _food = 100;
  double _talk = 100;
  var _rng = new Random();
//  Timer decrementor;

  double decrement(double stat) {
    var remainder = stat / 10;
    var num = 5;
    var check = stat - num;
    if (remainder == 0) {
      num -= 5;
    }
    return stat -= num;
  }

  double increment(double stat) {
    if (stat > 100) {
      var remains = stat - 100;
      stat -= remains;
    } else if (stat < 100){
      var num = 10;
      stat += num;
    }
    if (_hp > 100) {
      var offTheTop = _hp - 100;
      _hp -= offTheTop;
    }
    if (_food > 100) {
      var offTheTop = _food - 100;
      _food -= offTheTop;
    }
    if (_talk > 100) {
      var offTheTop = _talk - 100;
      _talk -= offTheTop;
    }
    return stat;
  }

  @override
  void initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
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
      // appBar: ,
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/covigotchi/GrammasHouseFinal.png"),
            alignment: Alignment.topCenter,
          )
        ),
        child:
        new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new ButtonBar(
              buttonMinWidth: 20,
              buttonHeight: 20,
              children: <Widget>[
                RaisedButton(onPressed: () {
                  setState(() {
                    _hp = increment(_hp);
                    _food = decrement(_food);
                    _talk = decrement(_talk);
                  });
                }, child: Text("Meds"),),
                RaisedButton(onPressed: () {                  setState(() {
                  _hp = decrement(_hp);
                  _food = increment(_food);
                  _talk = decrement(_talk);
                });}, child: Text("Munchies"),),
                RaisedButton(onPressed: () {                  setState(() {
                  _hp = decrement(_hp);
                  _food = decrement(_food);
                  _talk = increment(_talk);
                });}, child: Text("Masks"),),
                new Text("Health: $_hp"),
                new Text("Hunger: $_food"),
                new Text("Social Life: $_talk"),
              ],
            )],),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

