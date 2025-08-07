import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  const RecipeCard({super.key, required this.recipe, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        elevation: 3,
        // child: ListTile(
        //   leading: SizedBox( height: 200, child: Image.asset(recipe.image, width: 70, fit: BoxFit.fill)),
        //   title: Text(recipe.title,style: TextStyle(fontSize: 30),),
        //   subtitle: Text(recipe.category),
        //   onTap: onTap,
        // ),
       child:  Row(
        children: [
         SizedBox( height: 150, width: 150, child: Image.asset(recipe.image!, fit: BoxFit.cover)),
         const SizedBox(width: 10,) ,
         Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(recipe.title!,style: TextStyle(fontSize: 18),),
            Text(recipe.category!,style: TextStyle(fontSize: 16),),
             //Text(recipe.description,style: TextStyle(fontSize: 16),),
           ],),
         )
        ],
       ),),
    );
  }
}
