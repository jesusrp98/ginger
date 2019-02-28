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
                    'Fat',
                    _recipe.fat.quantity.toStringAsFixed(3) +
                        " " +
                        _recipe.fat.unit.toString(),
                  ),
                  Separator.spacer(),
                  RowItem.textRow(
                    context,
                    'Cholesterol',
                    _recipe.cholesterol.quantity.toStringAsFixed(3) +
                        " " +
                        _recipe.cholesterol.unit.toString(),
                  ),
                  Separator.spacer(),
                  RowItem.textRow(
                    context,
                    'Proteins',
                    _recipe.proteins.quantity.toStringAsFixed(3) +
                        " " +
                        _recipe.proteins.unit.toString(),
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
