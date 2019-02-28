import 'package:flutter/material.dart';
import 'package:ginger/widgets/card_information.dart';
import 'package:ginger/widgets/card_main_info.dart';
import 'package:ginger/widgets/card_page.dart';
import 'package:ginger/widgets/row_item.dart';

import '../../models/recipe.dart';

class RecipePage extends StatelessWidget {
  final Recipe _recipe;

  RecipePage(this._recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_recipe.name), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CardPhoto(
              url: _recipe.photo,
              name: _recipe.name,
            ),
            CardRecipe(
              calorie: _recipe.calories,
              serv: _recipe.servs,
              time: _recipe.time,
              vegan: "",
              vegetarian: "",
              diet: _recipe.diets,
              fat: _recipe.fat,
              cholesterol: _recipe.cholesterol,
              proteins: _recipe.proteins,
            ),
          ],
        ),
      ),
    );
  }
}
