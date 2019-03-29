import 'package:flutter/material.dart';

import '../../models/recipe.dart';
import '../../widgets/hero_image.dart';
import '../../widgets/list_cell.dart';
import '../../widgets/separator.dart';
import 'recipe.dart';

class RecipesDialog extends StatelessWidget {
  final String title;
  final List recipes;

  RecipesDialog({this.title, this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.separated(
        itemCount: recipes.length,
        separatorBuilder: (context, index) =>
            Separator.divider(height: 0, indent: 88),
        itemBuilder: (_, index) {
          final Recipe recipe = recipes[index];
          return ListCell(
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: HeroImage.list(
                url: recipe.photo,
                tag: recipe.name,
              ),
            ),
            title: recipe.name,
            subtitle: recipe.displayPeople,
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipePage(recipe),
                  ),
                ),
          );
        },
      ),
    );
  }
}
