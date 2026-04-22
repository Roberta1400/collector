import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProgressController extends GetxController {
  final completedLevels = <int>{}.obs;
  final highScores = <int, int>{}.obs; 
  late Box box;

  @override
  void onInit() {
    super.onInit();
    box = Hive.box('progress');

    List<dynamic>? savedLevels = box.get('completedLevels');
    if (savedLevels != null) {
      completedLevels.addAll(savedLevels.cast<int>());
    }

    Map<dynamic, dynamic>? savedScores = box.get('highScores');
    if (savedScores != null) {
      savedScores.forEach((key, value) {
        highScores[key as int] = value as int;
      });
    }
  }

  bool isUnlocked(int level) {
    return level == 1 || completedLevels.contains(level - 1);
  }

  void completeLevel(int level, int score) {
    completedLevels.add(level);
    box.put('completedLevels', completedLevels.toList());

    if (!highScores.containsKey(level) || score > highScores[level]!) {
      highScores[level] = score;
      box.put('highScores', highScores);
    }
  }

  int getHighScore(int level) {
    return highScores[level] ?? 0;
  }
}