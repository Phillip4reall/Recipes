import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipe_provider.dart';
import '../models/recipe.dart';


class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Recipe recipe =
        ModalRoute.of(context)!.settings.arguments as Recipe;
    final provider = context.watch<RecipeProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(recipe.category!),
        actions: [
          IconButton(
            icon: Icon(provider.isFavorite(recipe)
                ? Icons.favorite
                : Icons.favorite_border),
            onPressed: () => provider.toggleFavorite(recipe),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 1,
            margin: EdgeInsets.all(0),
            child: Column(
              children: [
                //const SizedBox(height: 30,),
                Image.asset(recipe.image!),
                 Center(child: Text(recipe.title!,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 40,
                  color: Colors.amber,
                  child: Center(child: Text('Ingredients',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.white),))),
                 const SizedBox(height: 16),
                Text(recipe.ingredients!),
                 const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 40,
                  color: Colors.amber,
                  child: Center(child: Text('Preparation',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.white),))),
                  const SizedBox(height: 16),
                  Text(recipe.prepare!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
