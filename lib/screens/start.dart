import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'level_select.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Tapped!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Tap the falling shapes as fast as you can for 10 seconds to score points!\n"
                "Complete levels to unlock the next ones.",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Get.to(() => LevelSelectScreen()),
                child: Text("Start"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}