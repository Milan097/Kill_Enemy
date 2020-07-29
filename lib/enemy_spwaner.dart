import 'package:fluttergame/Components/enemy.dart';
import 'package:fluttergame/game_controller.dart';

class EnemySpwaner {
  final GameController gameController;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 700;
  final int intervalChange = 3;
  final int maxEnemy = 6;
  int currentInterval;
  int nextSpawn;

  EnemySpwaner(this.gameController) {
    initialize();
  }

  void initialize() {
    killAllEnemies();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAllEnemies() {
    gameController.enemies.forEach((Enemy enemy) => enemy.isDead = true);
  }

  void update(double t) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if(gameController.enemies.length < maxEnemy && now >= nextSpawn) {
      gameController.spawnEnemy();
      if(currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval*0.1).toInt();
      }
      nextSpawn = now + currentInterval;
    }
  }
}