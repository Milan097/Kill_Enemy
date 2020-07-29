import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttergame/game_controller.dart';
import 'package:fluttergame/temp.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//  GameController gameController = GameController(sharedPreferences);
  runApp(Demo());

  // To bind tap gesture recognizer with our game
  TapGestureRecognizer tapper = TapGestureRecognizer();
//  tapper.onTapDown = gameController.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}