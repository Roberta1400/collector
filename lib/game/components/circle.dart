import 'dart:math';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import '../tap_game.dart';

class TapCircle extends BodyComponent<TapGame> with TapCallbacks {
  final rand = Random();

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(rand.nextDouble() * 10 - 5, -10),
      type: BodyType.dynamic,
    );

    return world.createBody(bodyDef)
      ..createFixture(FixtureDef(CircleShape()..radius = 2));
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.addScore();
    removeFromParent();
  }
}
