import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipe_provider.dart';
import 'package:recipes/widget_adaptive_layout.dart';
import 'package:recipes/widgets/recipec_card.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context);
    final recipes = provider.recipes.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Favorites'),
              onTap: () => Navigator.pushNamed(context, '/favorites'),
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
          ],
        ),
      ),
      body: ResponsiveLayout(
       mobileBody: ListView.builder(
  itemCount: recipes.length,
  itemBuilder: (_, index) {
    final recipe = recipes[index];
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: recipe);
      },
      child: RecipeCard(
        recipe: recipes[index],
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: recipe);
        },
      ),
    );
    return null; }),
        tabletBody: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3 / 2,
          ),
          itemCount: recipes.length,
          itemBuilder: (_, index) => RecipeCard(recipe: recipes[index],onTap: (){},),
        ),
        desktopBody: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          itemCount: recipes.length,
          itemBuilder: (_, index) => RecipeCard(recipe: recipes[index],onTap: (){},),
        ),
      ),
    );
  }
}
