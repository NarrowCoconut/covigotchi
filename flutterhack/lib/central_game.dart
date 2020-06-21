import 'package:flame/components/component.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';

class CentralGame extends BaseGame {
  CentralGame() {
    add(new MyCrate());
  }

  @override
  void render(Canvas canvas) {}

  @override
  void update(double delta) {}
}

class MyCrate extends SpriteComponent {
  // creates a component that renders the crate.png sprite, with size 16 x 16
  MyCrate()
      : super.fromSprite(
            16.0, 16.0, new Sprite('assets/images/grandma/healthy.png'));

  @override
  void resize(Size size) {
    // we don't need to set the x and y in the constructor, we can set then here
    this.x = (size.width - this.width) / 2;
    this.y = (size.height - this.height) / 2;
  }
}
