import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipes/models/recipe.dart';
import '../utils/sample_data.dart';

class RecipeProvider with ChangeNotifier {
  final List<Recipe> _recipes = sampleRecipes;
  List<Recipe> _filtered = sampleRecipes;
  final Box<Recipe> _favoriteBox = Hive.box<Recipe>('favorites');

  List<Recipe> get recipes => _filtered;
  List<Recipe> get favorites => _favoriteBox.values.toList();

  void search(String query) {
    _filtered = _recipes
        .where((r) => r.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void filterByCategory(String category) {
    if (category == 'All') {
      _filtered = _recipes;
    } else {
      _filtered = _recipes.where((r) => r.category == category).toList();
    }
    notifyListeners();
  }

  void toggleFavorite(Recipe recipe) {
    if (_favoriteBox.values.contains(recipe)) {
      _favoriteBox.deleteAt(_favoriteBox.values.toList().indexOf(recipe));
    } else {
      _favoriteBox.add(recipe);
    }
    notifyListeners();
  }

  bool isFavorite(Recipe recipe) {
    return _favoriteBox.values.any((r) => r.title == recipe.title);
  }

  void removeFromFavorites(Recipe recipe) {
 _favoriteBox.deleteAt(_favoriteBox.values.toList().indexOf(recipe));
  notifyListeners();
}
}
