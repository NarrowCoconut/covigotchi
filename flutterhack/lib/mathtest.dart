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
  Image _granny = new Image.asset('assets/images/StatefulHouse/GrammasHealthy.png', scale: .3,);
  Image _grannyUnwell = new Image.asset('assets/images/StatefulHouse/sickhouse.png', scale: .3,);
  Image _grannySick = new Image.asset('assets/images/StatefulHouse/sickhouse2.png', scale: .3,);
  Image _grannyGone = new Image.asset('assets/images/StatefulHouse/deadhouse2.png', scale: .3,);
  Image _grocery = new Image.asset('assets/images/sprites/groceryBag.png', scale: .3);
  Image _pills = new Image.asset('assets/images/sprites/medBottle.png', scale: .3,);
  Image _masks = new Image.asset('assets/images/sprites/n85Mask.png', scale: .3,);
  Image _title = new Image.asset('assets/images/CovaGotchi.png', scale: 2);
//  Timer decrementor;
  String _greeting = "How ya doing honey?";
  String _munch = "GRANNY HUNGRY! NOM! NOM! NOM!";
  String _intro = "Keep granny happy and healthy";
  String _medicine = "That's where those pills went!";
  String _cover = "Put a mask on and say hello dear";
  String _gameOver = "GAME OVER";
  String _sick = "granny's feeling a little ill";
  String _message = "";
// The granny code
  String message() {
    if(grannyState() == _granny) {
      return _greeting;
    } else if(grannyState() == _grannyUnwell || grannyState() == _grannySick) {
      return _sick;
    } else if(grannyState() == _grannyGone) {
      return _gameOver;
    }
  }
  Image grannyState() {
    var average = (_hp + _food + _talk) / 3;
    if (average > 50 && average <= 75) {
      return _grannyUnwell;
    } else if (average < 25 && average > 1) {
      return _grannySick;
    } else if (_hp == 0 || _food == 0 || _talk == 0) {
      return _grannyGone;
    } else {
      return _granny;
    }
  }

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
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/covigotchi/GrammasHouseFinal.png"),
        //     alignment: Alignment.topCenter,
        //   )
        // ),
        child:
        new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title,
              new ButtonBar(
              buttonMinWidth: 20,
              buttonHeight: 20,
              children: <Widget>[
                RaisedButton(onPressed: () {
                  setState(() {
                    _hp = increment(_hp);
                    _food = decrement(_food);
                    _talk = decrement(_talk);
                    _message = _medicine;
                  });
                }, child: _pills,),
                RaisedButton(onPressed: () {                  setState(() {
                  _hp = decrement(_hp);
                  _food = increment(_food);
                  _talk = decrement(_talk);
                  _message = _munch;
                });}, child: _grocery,),
                RaisedButton(onPressed: () {                  setState(() {
                  _hp = decrement(_hp);
                  _food = decrement(_food);
                  _talk = increment(_talk);
                  _message = _cover;
                });}, child: _masks,),
                grannyState(),
                new Text(_message),
                new Text(message()),
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
