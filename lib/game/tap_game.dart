import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:get/get.dart';
import 'level.dart';
import '../controllers/progress.dart';
import '../screens/result.dart';
import 'components/circle.dart';
import 'components/rectangle.dart';
import 'components/triangle.dart';
import 'components/bounds.dart';
import 'dart:async';
import 'package:flame/components.dart';

class TapGame extends Forge2DGame {
  final GameLevel level;

  double timeLeft = 10;
  int score = 0;
  bool finished = false;

  TapGame(this.level)
      : super(
          camera: CameraComponent.withFixedResolution(
            width: 800,
            height: 600,
          ),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    world.add(GameBounds());

    for (int i = 0; i < level.shapeCount; i++) {
      world.add(TapCircle());
      world.add(TapRectangle());
      world.add(TapTriangle());
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    timeLeft -= dt;

    if (timeLeft <= 0 && !finished) {
      finished = true;
      Get.find<ProgressController>().completeLevel(level.id, score);

      Get.offAll(() => ResultScreen(score: score));
    }
  }

  void addScore() => score++;
}