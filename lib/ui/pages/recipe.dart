import 'package:flutter/material.dart';

import '../../models/recipe.dart';
import '../../widgets/card_main_info.dart';
import '../../widgets/card_page.dart';
import '../../widgets/row_item.dart';
import '../../widgets/separator.dart';

class RecipePage extends StatelessWidget {
  final Recipe _recipe;

  RecipePage(this._recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_recipe.name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CardPhoto(
              url: _recipe.photo,
              name: _recipe.name,
            ),
            Separator.cardSpacer(),
            CardPage(
              title: 'NUTRITIONAL VALUES',
              body: Column(
                children: <Widget>[
                  RowItem.textRow(
                    context,
                    'Calories',
                    _recipe.calories.toStringAsFixed(3) + " kcal",
                  ),
                  Separator.spacer(),
                  RowItem.textRow(
                    context,
                    'Number of guests',
                    _recipe.servs.toString(),
                  ),
                  Separator.spacer(),
                  RowItem.textRow(
                    context,
                    'Preparation time',
                    _recipe.time.toString(),
                  ),
                  Separator.spacer(),
                  RowItem.textRow(
                    context,
                    'Diet',
                    _recipe.diets.toString(),
                  ),
                  Separator.spacer(),
                  RowItem.textRow(
                    context,
                    _recipe.fat.getLabel,
                    _recipe.fat.getInfo,
                  ),
                  Separator.spacer(),
                  RowItem.textRow(
                    context,
                    _recipe.cholesterol.getLabel,
                    _recipe.cholesterol.getInfo,
                  ),
                  Separator.spacer(),
                  RowItem.textRow(
                    context,
                    _recipe.proteins.getLabel,
                    _recipe.proteins.getInfo,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
