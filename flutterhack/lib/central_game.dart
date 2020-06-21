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
  CoviGotchi covigotchi;

  CentralGame() {
    addWidgetOverlay(
        'Buttons',
        Center(
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(Icons.adjust),
                  onPressed: () => print('Button pressed!'),
                ),
              )
            ],
          ),
        ));
  }

  void init() async {
    resize(await Flame.util.initialDimensions());
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color.fromRGBO(139, 159, 90, 1);
    canvas.drawRect(bgRect, bgPaint);
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void resize(Size size) {
    if (!inited) {
      screenSize = size;
      characterSize = screenSize.width / 2;
      covigotchi = CoviGotchi(characterSize);
      covigotchi.init(screenSize, characterSize);
      add(covigotchi);
    }
    super.resize(size);
  }
}

class CoviGotchi extends SpriteComponent {
  Size screenSize;
  double mySize;
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

  void init(Size screenS, double myS) {
    screenSize = screenS;
    mySize = myS;
    moveTo(screenSize.width / 2 - (mySize / 2),
        screenSize.height / 2 - (mySize / 2));
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
