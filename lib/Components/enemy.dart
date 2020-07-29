import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:fluttergame/game_controller.dart';

class Enemy {
  final GameController gameController;
  int health;
  int damage;
  double speed;
  Rect enemyRect;
  bool isDead = false;

  Enemy(this.gameController, double x, double y) {
    health = 3;
    damage = 1;
    speed = gameController.tileSize * 2;
    enemyRect = Rect.fromLTWH(
      x,
      y,
      gameController.tileSize*1.2,
      gameController.tileSize*1.2,
    );
  }

  void render(Canvas c) {
    Color color;
    if(health == 1) {
      color = Color(0xFFFF7F7F);
    } else if(health == 2) {
      color = Color(0xFFFF4C4C);
    } else if(health == 3) {
      color = Color(0xFFFF0101);
    } else {
      color = Color(0xFFFF0000);
    }
    Paint enemyPaint = Paint()..color = color;
    c.drawRect(enemyRect, enemyPaint);
  }

  void update(double t) {
    if(!isDead) {
      double whereToStop = gameController.tileSize*1.25;
      double stepDistance = speed*t;
      Offset toPlayer = gameController.player.playerRect.center - enemyRect.center;
      if(stepDistance < toPlayer.distance-whereToStop) {
        Offset stepToPlayer = Offset.fromDirection(toPlayer.direction, stepDistance);
        enemyRect = enemyRect.shift(stepToPlayer);
      } else {
        attackPlayer();
      }
    }
  }

  void attackPlayer() {
    if(!gameController.player.isDead) {
      gameController.player.currentHealth -= damage;
    }
  }

  void onTapDown() {
    if(!isDead) {
      health--;
      if(health <= 0) {
        isDead  = true;
        gameController.score++;
        if(gameController.score > (gameController.storage.getInt('highscore') ?? 0)) {
          gameController.storage.setInt('highscore', gameController.score);
        }
      }
    }
  }
}