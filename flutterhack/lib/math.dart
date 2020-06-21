import 'dart:async';
import 'dart:core';

import 'dart:math';

class Math {
  double health;
  double hunger;
  double social;
  var rng;
  Timer decrementor;

  Math() {
    health = 100;
    hunger = 100;
    social = 100;
    rng = new Random();
    decrementor = new Timer.periodic(Duration(seconds: 10), (timer) {
      decrementHealth();
      decrementHunger();
      decrementSocial();
      print(this.toString());
    });
  }

  // total health value
  //Operators
  void decrementHealth() {
    var num = rng.nextInt(10);
    health -= num;
  }

  void incrementHealth() {
    var num = rng.nextInt(10);
    health += num;
    print(this.toString());
  }

  void decrementHunger() {
    var num = rng.nextInt(10);
    hunger -= num;
  }

  void incrementHunger() {
    var num = rng.nextInt(10);
    hunger += num;
    print(this.toString());
  }
  void decrementSocial() {
    var num = rng.nextInt(10);
    social -= num;
  }

  void incrementSocial() {
    var num = rng.nextInt(10);
    social += num;
    print(this.toString());
  }

  //getters
  double getHealth() {
    return health;
  }

  double getHunger() {
    return hunger;
  }

  double getSocial() {
    return social;
  }

  @override
  String toString() {
    return "Health: " + health.toString() +
      " Hunger: " + hunger.toString() +
      " Social: " + social.toString();
  }
}
