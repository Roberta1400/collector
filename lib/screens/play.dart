import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/tap_game.dart';
import '../game/level.dart';

class GameScreen extends StatelessWidget {
  final GameLevel level;
  const GameScreen({required this.level});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: TapGame(level));
  }
}