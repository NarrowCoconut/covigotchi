import 'package:flutter/material.dart';
import 'central_game.dart';

class MainGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _gamePadding = _width / 8;

    return Scaffold(
      backgroundColor: _theme.primaryColor,
      resizeToAvoidBottomPadding: false,
      body: Center(
        child:
            // padding: const EdgeInsets.all(8.0),
            Container(
                constraints: BoxConstraints.expand(
                    height: _height - (_gamePadding),
                    width: _width - (_gamePadding)),
                child: CentralGame().widget),
      ),
    );
  }
}
