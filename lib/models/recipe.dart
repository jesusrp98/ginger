class Recipe {
  final String name, photo, recipeUrl, diet;
  final int servs; //Raciones
  final List health, ingrLines, ingr;
  final double calories, weight, time;


  Recipe({
    this.name,
    this.photo,
    this.recipeUrl,
    this.servs, //Raciones
    this.diet,
    this.health,
    this.ingrLines,
    this.ingr,
    this.calories,
    this.weight,
    this.time,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json['label'],
        photo: json['image'],
        recipeUrl: json['url'],
        servs: json['yield'], //Raciones
        diet: json['dietLabel'][0],
        health: json['healthLabels'],
        ingrLines: json['ingredientLines'],
        ingr: json['ingredients'],
        calories: json['calories'],
        weight: json['totalWeight'],
        time: json['totalTime']
    );
  }
}

class NutritionalValue {
  final String label;
  final double quantity;
  final String unit;

  NutritionalValue({
    this.label,
    this.quantity,
    this.unit
  });

  factory NutritionalValue.fromJson(Map<String, dynamic> json) {
    return NutritionalValue(
        label: json['label'],
        quantity: json['quantity'],
        unit: json['unit']
    );
  }

}