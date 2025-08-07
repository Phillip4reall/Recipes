import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/provider/recipe_provider.dart';
import 'package:recipes/screens/about_screen.dart';
import 'package:recipes/screens/contact_screen.dart';
import 'package:recipes/screens/favorite_screen.dart';
import 'package:recipes/screens/home_screen.dart';
import 'package:recipes/screens/recipe_details.dart';
import 'package:recipes/screens/recipes_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  await Hive.openBox<Recipe>('favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: ThemeData(primarySwatch: Colors.teal),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/list': (context) => const RecipeListScreen(),
          '/detail': (context) => const RecipeDetailScreen(),
          '/favorites': (context) => const FavoritesScreen(),
          '/about': (context) => const AboutScreen(),
          '/contact': (context) => const ContactScreen(),
        },
      ),
    );
  }
}
