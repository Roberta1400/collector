import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'controllers/progress.dart';
import 'screens/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); 
  await Hive.openBox('progress'); 

  Get.put(ProgressController());
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: StartScreen());
  }
}