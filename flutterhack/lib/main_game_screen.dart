import 'package:flutter/material.dart';
import 'central_game.dart';

class MainGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: _theme.primaryColor,
        resizeToAvoidBottomPadding: false,
        body: Center(
          child:
              // padding: const EdgeInsets.all(8.0),
              Container(
                  child: Image.asset('assets/images/covigotchi/healthy.png')
                  // constraints: BoxConstraints.expand(
                  //     height: _height - (_width / 12),
                  //     width: _width - (_width / 12)),
                  // child: CentralGame().widget),
                  ),
        ));
  }
}
