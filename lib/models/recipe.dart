import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? category;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? ingredients;
  @HiveField(5)
  final String? prepare;

  Recipe({required this.ingredients, required this.prepare, 
    required this.title,
    required this.image,
    required this.category,
    required this.description,
  });
}
