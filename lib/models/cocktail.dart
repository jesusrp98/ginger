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
  final String name, category, glassType, instruction, photo, tag;
  final List ingredients, measures;
  final bool isAlcoholic;

  Cocktail({
    this.name,
    this.category,
    this.tag,
    this.glassType,
    this.instruction,
    this.photo,
    this.ingredients,
    this.measures,
    this.isAlcoholic,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      name: json['strDrink'],
      category: json['strCategory'],
      tag: json['strIBA'],
      isAlcoholic: json['strAlcoholic'] == 'Alcoholic',
      glassType: json['strGlass'],
      instruction: json['strInstruction'],
      photo: json['strDrinkThumb'],
      ingredients: [
        json['strIngredient1'],
        json['strIngredient2'],
        json['strIngredient3'],
        json['strIngredient4'],
      ],
      measures: [
        json['strMeasure1'],
        json['strMeasure2'],
        json['strMeasure3'],
        json['strMeasure4'],
      ],
    );
  }

  String get getCategory => category;
  String get getGlass => glassType;
  String get getInstruction => instruction;
}
