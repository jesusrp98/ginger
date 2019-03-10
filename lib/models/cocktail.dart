import 'dart:convert';
import 'package:http/http.dart' as http;
import '../util/url.dart';

import 'query.dart';

class CocktailModel extends QueryModel {
  @override
  Future loadData() async {
    response = await http.get(Url.sampleCocktail);
    snapshot = json.decode(response.body);

    // For demo purposes
    print(snapshot);

    items.addAll(
      snapshot['drinks'].map((recipe) => Cocktail.fromJson(recipe)).toList(),
    );

    setLoading(false);
  }
}

class Cocktail {
  final String name, tag, glassType, instructions, photo;
  final List<CocktailIngredient> ingredients;
  final bool isAlcoholic;

  Cocktail({
    this.name,
    this.tag,
    this.glassType,
    this.instructions,
    this.photo,
    this.ingredients,
    this.isAlcoholic,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      name: json['strDrink'],
      tag: json['strIBA'],
      glassType: json['strGlass'],
      isAlcoholic: json['strAlcoholic'] == 'Alcoholic',
      instructions: json['strInstruction'],
      photo: json['strDrinkThumb'],
      ingredients: [
        CocktailIngredient(
          name: json['strIngredient1'],
          measure: json['strMeasure1'],
        ),
        CocktailIngredient(
          name: json['strIngredient2'],
          measure: json['strMeasure2'],
        ),
        CocktailIngredient(
          name: json['strIngredient3'],
          measure: json['strMeasure3'],
        ),
        CocktailIngredient(
          name: json['strIngredient4'],
          measure: json['strMeasure4'],
        ),
      ],
    );
  }

  String get getTag => tag ?? 'Unknown';

  String get getGlass => glassType ?? 'Unknown';

  String get getInstructions =>
      instructions ?? 'There are no instructions provided';

  List get getIngredients =>
      ingredients..removeWhere((ingredient) => ingredient.name == null);
}

class CocktailIngredient {
  final String name, measure;

  CocktailIngredient({this.name, this.measure});

  String get getMeasure => measure ?? '-';
}
