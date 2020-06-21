import 'package:flutter/material.dart';
import 'central_game.dart';

class MainGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _theme.primaryColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(child: CentralGame().widget)
            // ------------------- WORKING IMAGE WOWOWOWOW ----------
            // Container(
            //     constraints: BoxConstraints.expand(height: 200.0),
            //     decoration: BoxDecoration(color: Colors.grey),
            //     child: Image.asset(
            //       'assets/images/grandma/GrandmaHealthy.png',
            //       fit: BoxFit.cover,
            //     )),
            // ------------------------------------------------------
          ]),
    );
  }
}
