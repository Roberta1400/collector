import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'level_select.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  const ResultScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Score: $score", style: TextStyle(fontSize: 40)),
            ElevatedButton(
              onPressed: () => Get.offAll(() => LevelSelectScreen()),
              child: Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}