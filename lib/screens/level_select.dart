import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../game/level.dart';
import '../controllers/progress.dart';
import 'play.dart';
import 'start.dart';

class LevelSelectScreen extends StatelessWidget {
  final controller = Get.find<ProgressController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: levels.map((level) {
                  bool unlocked = controller.isUnlocked(level.id);
                  int highScore = controller.getHighScore(level.id);

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: unlocked
                            ? () => Get.to(() => GameScreen(level: level))
                            : null,
                        child: Text("Level ${level.id}"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "High Score: $highScore",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 40), 
              ElevatedButton(
                onPressed: () => Get.offAll(() => StartScreen()),
                child: Text("Back to Start Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}