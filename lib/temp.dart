import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:fluttergame/game_controller.dart';

class Demo extends StatefulWidget {
  int sec = 0;
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  Timer timer;
  Duration duration = Duration(seconds: 1);
  GameController gameController;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        widget.sec++;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if(gameController == null)
      gameController = GameController();
    return Container(
      child: Column(
        children: <Widget>[
        SizedBox(
        height: 200,
        child: gameController.widget,
      ),
      SizedBox(
        height: 200,
        child:Text(
            '${gameController.r}  --> ${widget.sec}',
          textDirection: TextDirection.ltr,
          ),
        ),
        ],
      ),
    );
  }
}