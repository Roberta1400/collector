class GameLevel {
  final int id;
  final int shapeCount;

  GameLevel({required this.id, required this.shapeCount});
}

final levels = [
  GameLevel(id: 1, shapeCount: 5),
  GameLevel(id: 2, shapeCount: 10),
  GameLevel(id: 3, shapeCount: 20),
];
