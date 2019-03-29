import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import '../../models/recipe.dart';
import '../../widgets/card_page.dart';
import '../../widgets/head_card_page.dart';
import '../../widgets/row_item.dart';
import '../../widgets/separator.dart';

class RecipePage extends StatelessWidget {
  final Recipe _recipe;

  RecipePage(this._recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_recipe.name),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'Share recipe',
            onPressed: () async => await FlutterWebBrowser.openWebPage(
                  url: _recipe.shareUrl,
                  androidToolbarColor: Theme.of(context).primaryColor,
                ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          HeadCardPage(
            title: _recipe.name,
            imageUrl: _recipe.photo,
            subtitle: InkResponse(
              child: Text(
                'See instructions',
                style: Theme.of(context).textTheme.subhead.copyWith(
                      color: Theme.of(context).textTheme.caption.color,
                      decoration: TextDecoration.underline,
                    ),
              ),
              onTap: () async => await FlutterWebBrowser.openWebPage(
                    url: _recipe.url,
                    androidToolbarColor: Theme.of(context).primaryColor,
                  ),
            ),
            body: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RecipeDetails(
                      icon: Icon(
                        Icons.people,
                        size: 27,
                        color: Theme.of(context).textTheme.caption.color,
                      ),
                      title: _recipe.getPeople,
                    ),
                    RecipeDetails(
                      icon: Icon(
                        Icons.schedule,
                        size: 27,
                        color: Theme.of(context).textTheme.caption.color,
                      ),
                      title: _recipe.getPreparationTime,
                    ),
                  ],
                ),
                Separator.spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RecipeDetails(
                      icon: Icon(
                        _recipe.isVegetarian
                            ? Icons.check_circle
                            : Icons.cancel,
                        size: 27,
                        color: Theme.of(context).textTheme.caption.color,
                      ),
                      title: 'Vegetarian',
                    ),
                    RecipeDetails(
                      icon: Icon(
                        _recipe.isVegan ? Icons.check_circle : Icons.cancel,
                        size: 27,
                        color: Theme.of(context).textTheme.caption.color,
                      ),
                      title: 'Vegan',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'NUTRITIONAL VALUES',
            body: Column(
              children: <Widget>[
                RowItem.textRow(
                  context,
                  'Total calories',
                  _recipe.getCalories,
                ),
                Separator.spacer(),
                RowItem.textRow(
                  context,
                  'Diet attributes',
                  _recipe.getDiet,
                ),
                Separator.divider(),
                Column(
                  children: _recipe.nutritionalValues
                      .map((value) => _getNutritionalValues(
                            context,
                            _recipe.nutritionalValues,
                            value,
                          ))
                      .toList(),
                )
              ],
            ),
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'INGREDIENTS',
            body: Column(
              children: _recipe.ingredients
                  .map((item) => _getIngredients(
                        context,
                        _recipe.ingredients,
                        item,
                      ))
                  .toList(),
            ),
          ),
          Separator.cardSpacer(),
          CardPage(
            title: 'CAUTIONS',
            body: Column(
              children: _recipe.healths
                  .map((health) => _getHealthLabels(_recipe.healths, health))
                  .toList(),
            ),
          ),
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

  Column _getNutritionalValues(
    BuildContext context,
    List nutritionalValues,
    NutritionalValue value,
  ) {
    return Column(children: <Widget>[
      RowItem.textRow(context, value.getLabel, value.getInfo),
      value != nutritionalValues.last ? Separator.spacer() : Separator.none()
    ]);
  }

  Column _getHealthLabels(List healthLabels, String health) {
    return Column(children: <Widget>[
      RowItem.iconRow(health, true),
      health != healthLabels.last ? Separator.spacer() : Separator.none(),
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
