import 'package:flutter/material.dart';

import '../../models/cocktail.dart';
import '../../widgets/card_page.dart';
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
            url: _cocktail.photo,
            name: _cocktail.name,
            body: Row(
              
            ),
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'INFORMATION',
            body: Column(
              children: <Widget>[
                RowItem.textRow(
                  context,
                  'Category',
                  _cocktail.getCategory,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Alcoholic',
                  _cocktail.getCategory, //Crear getter de alcoholic
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Type of Glass',
                  _cocktail.getGlass,
                ),
                Separator.divider(),
                RowItem.textRow(
                  context,
                  _cocktail.ingredients[0],
                  _cocktail.measures[0],
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  _cocktail.ingredients[1],
                  _cocktail.measures[1],
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  _cocktail.ingredients[2],
                  _cocktail.measures[2],
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  _cocktail.ingredients[3],
                  _cocktail.measures[3],
                ),
              ],
            ),
          ),
          Separator.cardSpacer(),
        ],
      ),
    );
  }

  Column _getIngredients(
    BuildContext context,
    List ingredients,
    String ingredient,
  ) {
    return Column(children: <Widget>[
      Text(
        ingredient,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subhead.copyWith(
              color: Theme.of(context).textTheme.caption.color,
            ),
      ),
      ingredient != ingredients.last ? Separator.spacer() : Separator.none(),
    ]);
  }
}

class RecipeDetails extends StatelessWidget {
  final Widget icon;
  final String title;

  RecipeDetails({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        icon,
        Text(
          title,
          style: Theme.of(context).textTheme.subhead.copyWith(
                color: Theme.of(context).textTheme.caption.color,
              ),
        )
      ],
    );
  }
}
