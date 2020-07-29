import 'dart:ui';

import 'package:fluttergame/game_controller.dart';

class HealthBar {
  final GameController gameController;
  Rect healthRect;
  Rect remainingHealthRect;

  HealthBar(this.gameController) {
    double barWidth = gameController.screenSize.width / 1.5;
    healthRect = Rect.fromLTWH(
      gameController.screenSize.width/2 - barWidth/2,
      gameController.screenSize.height*0.8,
      barWidth,
      gameController.tileSize*0.5,
    );

    remainingHealthRect = Rect.fromLTWH(
      gameController.screenSize.width/2 - barWidth/2,
      gameController.screenSize.height*0.8,
      barWidth,
      gameController.tileSize*0.5,
    );
  }

  void render(Canvas c) {
    Paint healthColor = Paint()..color = Color(0xFFFF0000);
    Paint remainColor = Paint()..color = Color(0xFF00FF00);

    c.drawRect(healthRect, healthColor);
    c.drawRect(remainingHealthRect, remainColor);
  }

  void update(double t) {
    double barWidth = gameController.screenSize.width / 1.5;
    double percentHealth = gameController.player.currentHealth / gameController.player.maxHealth;

    remainingHealthRect = Rect.fromLTWH(
      gameController.screenSize.width/2 - barWidth/2,
      gameController.screenSize.height*0.8,
      barWidth * percentHealth,
      gameController.tileSize*0.5,
    );
  }
}