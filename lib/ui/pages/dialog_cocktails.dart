import 'package:flutter/material.dart';

import '../../models/cocktail.dart';
import '../../widgets/hero_image.dart';
import '../../widgets/list_cell.dart';
import '../../widgets/separator.dart';
import 'cocktail.dart';

class CocktailsDialog extends StatelessWidget {
  final String title;
  final List cocktails;

  CocktailsDialog({this.title, this.cocktails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.separated(
        itemCount: cocktails.length,
        separatorBuilder: (context, index) =>
            Separator.divider(height: 0, indent: 88),
        itemBuilder: (_, index) {
          final Cocktail cocktail = cocktails[index];
          return ListCell(
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: HeroImage.list(
                url: cocktail.photo,
                tag: cocktail.name,
              ),
            ),
            title: cocktail.name,
            subtitle: cocktail.glassType,
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CocktailPage(cocktail),
                  ),
                ),
          );
        },
      ),
    );
  }
}
