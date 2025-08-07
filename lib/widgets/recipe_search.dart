import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/recipe_provider.dart';


class RecipeSearch extends StatelessWidget {
  const RecipeSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search recipes...',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (val) => context.read<RecipeProvider>().search(val),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['All', 'Rice', 'Soup', 'Snack']
                .map(
                  (cat) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: ElevatedButton(
                      onPressed: () => context
                          .read<RecipeProvider>()
                          .filterByCategory(cat),
                      child: Text(cat),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
