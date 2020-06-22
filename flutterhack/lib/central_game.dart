import 'dart:io';

import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flame/time.dart';
import 'package:flutter/services.dart';

class CentralGame extends BaseGame with HasWidgetsOverlay {
  Size screenSize;
  double characterSize;
  bool inited = false;
  CoviGotchi coviGotchi;

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
    } else if (stat < 100) {
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

  void up() {}

  CentralGame() {
    add(CoviGotchi(200));
    init();
    addWidgetOverlay(
        'Buttons',
        Container(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ButtonBar(
              buttonMinWidth: 20,
              buttonHeight: 20,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _hp = increment(_hp);
                    _food = decrement(_food);
                    _talk = decrement(_talk);
                  },
                  child: Text("Meds"),
                ),
                RaisedButton(
                  onPressed: () {
                    _hp = decrement(_hp);
                    _food = increment(_food);
                    _talk = decrement(_talk);
                  },
                  child: Text("Munchies"),
                ),
                RaisedButton(
                  onPressed: () {
                    _hp = decrement(_hp);
                    _food = decrement(_food);
                    _talk = increment(_talk);
                  },
                  child: Text("Masks"),
                ),
                new Text("Health: $_hp"),
                new Text("Hunger: $_food"),
                new Text("Social Life: $_talk"),
              ],
            )
          ],
        )));
  }

  void init() async {
    screenSize = await Flame.util.initialDimensions();
  }

  @override
  void render(Canvas canvas) {
    if (!inited) {
      Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
      Paint bgPaint = Paint();
      bgPaint.color = Colors.white; //Color.fromRGBO(139, 159, 90, 1);
      canvas.drawRect(bgRect, bgPaint);
    }
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    characterSize = screenSize.width / 2;
    super.resize(size);
  }
}

class CoviGotchi extends SpriteComponent {
  static double rand() => Random.secure().nextDouble();
  static double avgTimeBetweenIdleAnimations = 3;
  static double variationBetweenIdleAnimations = 1;
  static double nextTimeBetweenIdleAnimations =
      avgTimeBetweenIdleAnimations + variationBetweenIdleAnimations * rand();
  final countdown = Timer(1000 * avgTimeBetweenIdleAnimations);

  CoviGotchi(double dim)
      : super.fromSprite(dim, dim, new Sprite('covigotchi/healthy.png'));

  void moveTo(double x, double y) {
    this.x = x;
    this.y = y;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    print(dt);
    super.update(dt);
    countdown.update(dt);
    if (countdown.isFinished()) {
      doRandomIdleAnimation();
    }
  }

  void doRandomIdleAnimation() {
    print('doing a dance');
  }
}
