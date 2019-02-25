import 'query.dart';

class CocktailModel extends QueryModel {
  @override
  Future loadData() {
    // TODO: implement loadData
    return null;
  }

}

class Cocktail {
  final String name;
  final String category;
  final String glassType;
  final String instruction;
  final String photo;
  final String ingr1;
  final String ingr2;
  final String ingr3;
  final String ingr4;
  final String msure1;
  final String msure2;
  final String msure3;
  final String msure4;

  Cocktail(
    {this.name,
    this.category,
    this.glassType,
    this.instruction,
    this.photo,
    this.ingr1,
    this.ingr2,
    this.ingr3,
    this.ingr4,
    this.msure1,
    this.msure2,
    this.msure3,
    this.msure4
    });

  factory Cocktail.fromJson(Map<String, dynamic> json){
    return Cocktail(
        name: json["strDrink"],
        category: json["strCategory"],
        glassType: json["strGlass"],
        instruction: json["strInstruction"],
        photo: json["strDrinkThumb"],
        ingr1: json["strIngredient1"],
        ingr2: json["strIngredient2"],
        ingr3: json["strIngredient3"],
        ingr4: json["strIngredient4"],
        msure1: json["strMeasure1"],
        msure2: json["strMeasure2"],
        msure3: json["strMeasure3"],
        msure4: json["strMeasure4"]
    );
  }
}
