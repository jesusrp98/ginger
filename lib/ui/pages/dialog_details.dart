import 'package:flutter/material.dart';

import '../../models/item_ginger.dart';
import '../../models/recipe.dart';
import '../../widgets/hero_image.dart';
import '../../widgets/list_cell.dart';
import '../../widgets/separator.dart';
import 'cocktail.dart';
import 'recipe.dart';

/// COCKTAILS AND RECIPES 'MORE' VIEW
/// It will let you take a look for further cocktails or recipes
/// of a category by clicking 'More'
class DetailsDialog extends StatelessWidget {
  final String title;
  final List recipes;

  DetailsDialog({this.title, this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.separated(
        itemCount: recipes.length,
        separatorBuilder: (context, index) =>
            Separator.divider(height: 0, indent: 88),
        itemBuilder: (_, index) {
          final GingerItem item = recipes[index];
          return ListCell(
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: HeroImage.list(
                url: item.photo,
                tag: item.name,
              ),
            ),
            title: item.name,
            subtitle: item.subtitle,
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        item is Recipe ? RecipePage(item) : CocktailPage(item),
                  ),
                ),
          );
        },
      ),
    );
  }
}
