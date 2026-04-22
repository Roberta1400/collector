import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/extensions.dart' hide Vector2;

class GameBounds extends BodyComponent {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      type: BodyType.static,
      position: Vector2.zero(),
    );

    Body gameBoundsBody = world.createBody(bodyDef);
    final gameRect = game.camera.visibleWorldRect;
    final gameBoundsVectors = [
      gameRect.topLeft.toVector2(),
      gameRect.topRight.toVector2(),
      gameRect.bottomRight.toVector2(),
      gameRect.bottomLeft.toVector2(),
    ];

    for (int i = 0; i < gameBoundsVectors.length; i++) {
      gameBoundsBody.createFixture(
        FixtureDef(
          EdgeShape()
            ..set(gameBoundsVectors[i], gameBoundsVectors[(i + 1) % gameBoundsVectors.length]),
        ),
      );
    }


    return gameBoundsBody;
  }
}