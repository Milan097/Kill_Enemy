import 'dart:ui';

import 'package:fluttergame/game_controller.dart';

class Player {
  int maxHealth;
  int currentHealth;
  Rect playerRect;
  final GameController gameController;
  bool isDead = false;

  Player(this.gameController) {
    maxHealth = currentHealth = 300;
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(
        gameController.screenSize.width / 2 - size / 2,
        gameController.screenSize.height / 2 - size / 2,
        size,
        size,
    );
  }

  void render(Canvas c) {
    Paint playerPaint = Paint()..color = Color(0xFF0000FF);
    c.drawRect(playerRect, playerPaint);
  }

  void update(double t) {
//    print(currentHealth);
    if(!isDead && currentHealth <= 0) {
      isDead = true;
      gameController.initialize();
    }
  }
}