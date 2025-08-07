import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipe_provider.dart';
import 'package:recipes/widgets/recipec_card.dart';
import '../widgets/recipe_search.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RecipeProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const RecipeSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: provider.recipes.length,
              itemBuilder: (ctx, i) {
                final recipe = provider.recipes[i];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: recipe);
                  },
                  child: RecipeCard(
                    recipe: recipe,
                    onTap: () =>
                        Navigator.pushNamed(context, '/detail', arguments: recipe),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
