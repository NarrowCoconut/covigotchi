import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:layout/mathtest.dart';
import 'main_game_screen.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true;
  Flame.audio.disableLog();
  runApp(CoviGotchi());
} //End Main()

class CoviGotchi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        title: 'CoviGotchi',
        home: MathTest(),
        theme: ThemeData(
            primaryColor: Colors.red[300],
            primaryColorDark: Colors.pink[700],
            backgroundColor: Colors.pink[200]));
  }
} //End Class App
