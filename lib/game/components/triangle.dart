import 'dart:math';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import '../tap_game.dart';

class TapTriangle extends BodyComponent<TapGame> with TapCallbacks {
  final rand = Random();

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(rand.nextDouble() * 10 - 5, -10),
      type: BodyType.dynamic,
    );

    final shape = PolygonShape()
      ..set([Vector2(0, 0), Vector2(3, 0), Vector2(1.5, 3)]);

    return world.createBody(bodyDef)..createFixture(FixtureDef(shape));
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.addScore();
    removeFromParent();
  }
}
