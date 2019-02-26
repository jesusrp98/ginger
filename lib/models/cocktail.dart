import 'query.dart';

class CocktailModel extends QueryModel {
  @override
  Future loadData() {
    // TODO: implement loadData
    return null;
  }

}

class Cocktail {
  final String name, category, glassType, instruction, photo;
  final List ingredient, measure;

  Cocktail(
    {this.name,
    this.category,
    this.glassType,
    this.instruction,
    this.photo,
    this.ingredient,
    this.measure
    });

  factory Cocktail.fromJson(Map<String, dynamic> json){
    return Cocktail(
        name: json["strDrink"],
        category: json["strCategory"],
        glassType: json["strGlass"],
        instruction: json["strInstruction"],
        photo: json["strDrinkThumb"],
        ingredient: [
          json["strIngredient1"],
          json["strIngredient2"],
          json["strIngredient3"],
          json["strIngredient4"]
        ],
        measure: [
          json["strMeasure1"],
          json["strMeasure2"],
          json["strMeasure3"],
          json["strMeasure4"]
        ]
    );
  }
}
