// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:recipes/provider/recipe_provider.dart';
// import 'package:recipes/widgets/recipec_card.dart';


// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<RecipeProvider>();
//     final favorites = provider.favorites;

//     if (favorites.isEmpty) {
//       return const Center(child: Text("No favorites yet"));
//     }

//     return ListView.builder(
//       itemCount: favorites.length,
//       itemBuilder: (ctx, i) {
//         final recipe = favorites[i];
//         return RecipeCard(
//           recipe: recipe,
//           onTap: () => Navigator.pushNamed(context, '/detail', arguments: recipe),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipe_provider.dart';
import 'package:recipes/widgets/recipec_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RecipeProvider>();
    final favorites = provider.favorites;

    if (favorites.isEmpty) {
      return const Center(child: Text("No favorites yet"));
    }

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (ctx, i) {
        final recipe = favorites[i];

        return Dismissible(
          key: Key(recipe.toString()), // Ensure each item has a unique key
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            setState(() {
              //favorites.removeAt(recipe.image.length);
             provider.removeFromFavorites(recipe);
            });
           // provider.removeFromFavorites(recipe);
             //favorites.remove(recipe);
            // provider.removeListener(recipe.toString);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${recipe.title} removed from favorites')),
            );
          },
          child: RecipeCard(
            recipe: recipe,
            onTap: () => Navigator.pushNamed(context, '/detail', arguments: recipe),
          ),
        );
      },
    );
  }
}
