import 'package:flutter/material.dart';
import 'package:ginger/models/recipe.dart';
import 'package:ginger/widgets/row_item.dart';

class CardRecipe extends StatelessWidget {
  final double calorie;
  final double serv;
  final double time;
  final String vegan;
  final String vegetarian;
  final List diet;
  final NutritionalValue fat;
  final NutritionalValue cholesterol;
  final NutritionalValue proteins;

  CardRecipe({
    this.calorie,
    this.serv,
    this.time,
    this.vegan,
    this.vegetarian,
    this.diet,
    this.fat,
    this.cholesterol,
    this.proteins,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RowItem.textRow(context, 'Calories', calorie.toStringAsFixed(3)),
            RowItem.textRow(context, 'Number of guests', serv.toString()),
            RowItem.textRow(context, 'Preparation time', time.toString()),
            //Veganos
            //Vegetarianos
            RowItem.textRow(context, 'Diet', diet.toString()),
            RowItem.textRow(context, 'Fat', fat.quantity.toStringAsFixed(3)+ " " + fat.unit.toString()),
            RowItem.textRow(context, 'Cholesterol', cholesterol.quantity.toStringAsFixed(3)+ " " + cholesterol.unit.toString()),
            RowItem.textRow(context, 'Proteins', proteins.quantity.toStringAsFixed(3)+ " " + proteins.unit.toString()),
          ],
        ),
      ),
    );
  }
}
