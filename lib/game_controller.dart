import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttergame/Components/Player.dart';
import 'package:fluttergame/Components/enemy.dart';
import 'package:fluttergame/Components/health_bar.dart';
import 'package:fluttergame/Components/highscoreText.dart';
import 'package:fluttergame/Components/score_text.dart';
import 'package:fluttergame/Components/start_text.dart';
import 'package:fluttergame/enemy_spwaner.dart';
import 'package:fluttergame/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameController extends Game {
  Random rand;

  SharedPreferences storage;
  Size screenSize;
  double tileSize;
  Player player;
  List<Enemy> enemies;
  HealthBar healthBar;
  EnemySpwaner enemySpwaner;
  int score;
  ScoreText scoreText;
  curState state;
  HighScoreText highScoreText;
  StartText startText;
  int r = 0,u = 0;
  int curR = 0;
  Function function;

  GameController({this.function}) {
    initialize();
  }
  Timer timer;
  void initialize() async{
//    resize(await Flame.util.initialDimensions());
//    state = curState.menu;
//    rand = Random();
//    player = Player(this);
//    enemies = List<Enemy>();
//    healthBar = HealthBar(this);
//    enemySpwaner = EnemySpwaner(this);
//    score = 0;
//    scoreText = ScoreText(this);
//    highScoreText = HighScoreText(this);
//    startText = StartText(this);
//    Future.delayed(Duration(seconds: 1), () {
//      this.curR = r;
//      print('$r and $curR');
//      function();
//    });
  }

  void render(Canvas c) {
    r++;
//    print('r->$r');
//    Rect background = Rect.fromLTWH(0.0, 0.0, screenSize.width, screenSize.height);
//    Paint backgroundPaint = Paint()..color = Color(0xFF000000);
//    c.drawRect(background, backgroundPaint);
//
//    player.render(c);
//    if(state == curState.menu) {
//      startText.render(c);
//      highScoreText.render(c);
//    } else if(state == curState.playing) {
//      enemies.forEach((Enemy enemy) => enemy.render(c));
//      scoreText.render(c);
//      healthBar.render(c);
//    }
  }

  void update(double t) {
    u++;
//    if(state == curState.menu) {
//      startText.update(t);
//      highScoreText.update(t);
//    } else if(state == curState.playing) {
//      enemies.forEach((Enemy enemy) => enemy.update(t));
//      enemies.removeWhere((Enemy enemy) => enemy.isDead);
//      player.update(t);
//      scoreText.update(t);
//      healthBar.update(t);
//      enemySpwaner.update(t);
//    }
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  void onTapDown(TapDownDetails d) {
    print(d.globalPosition);
    if(state == curState.menu) {
      state = curState.playing;
    } else if(state == curState.playing) {
      enemies.forEach((Enemy enemy) {
        if (enemy.enemyRect.contains(d.globalPosition)) {
          enemy.onTapDown();
        }
      });
    }
  }


  void spawnEnemy() {
    double x,y;
    switch(rand.nextInt(4)) {
      case 0:
        // Top
        x = rand.nextDouble()*screenSize.width;
        y = -tileSize*2.5;
        break;
      case 1:
        // Bottom
        x = rand.nextDouble()*screenSize.width;
        y = screenSize.height + tileSize*2.5;
        break;
      case 2:
        // Left
        y = rand.nextDouble()*screenSize.height;
        x = -tileSize*2.5;
        break;
      case 3:
        // Right
        y = rand.nextDouble()*screenSize.height;
        x = screenSize.width + tileSize*2.5;
        break;
    }
    enemies.add(Enemy(this, x, y));
  }
}