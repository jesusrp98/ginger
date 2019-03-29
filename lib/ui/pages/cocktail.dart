import 'package:flutter/material.dart';

import '../../models/cocktail.dart';
import '../../widgets/card_page.dart';
import '../../widgets/expand_widget.dart';
import '../../widgets/head_card_page.dart';
import '../../widgets/row_item.dart';
import '../../widgets/separator.dart';

class CocktailPage extends StatelessWidget {
  final Cocktail _cocktail;

  CocktailPage(this._cocktail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_cocktail.name), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: _cocktail.name,
            imageUrl: _cocktail.photo,
            subtitle: Text(
              _cocktail.getTag,
              style: Theme.of(context).textTheme.subhead.copyWith(
                    color: Theme.of(context).textTheme.caption.color,
                  ),
            ),
            body: TextExpand(
              text: _cocktail.getInstructions,
              maxLength: 7,
              style: TextStyle(
                color: Theme.of(context).textTheme.caption.color,
                fontSize: 15,
              ),
            ),
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'INFORMATION',
            body: Column(
              children: <Widget>[
                RowItem.textRow(
                  context,
                  'Type of glass',
                  _cocktail.getGlass,
                ),
                Separator.spacer(),
                RowItem.iconRow(
                  'Alcoholic',
                  _cocktail.isAlcoholic,
                ),
                Separator.divider(),
                Column(
                  children: _cocktail.ingredients
                      .map((ingredient) => _getIngredients(
                            context,
                            _cocktail.ingredients,
                            ingredient,
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _getIngredients(
    BuildContext context,
    List ingredients,
    CocktailIngredient ingredient,
  ) {
    return Column(children: <Widget>[
      RowItem.textRow(context, ingredient.name, ingredient.getMeasure),
      ingredient != ingredients.last ? Separator.spacer() : Separator.none(),
    ]);
  }
}
