class Recipe {
  final String name, photo, url, shareUrl, source;
  final int servs;
  final List healths, ingredients, diets;
  final double calories, weight, time;
  final NutritionalValue sugar, fat, cholesterol, proteins;

  Recipe({
    this.name,
    this.photo,
    this.url,
    this.shareUrl,
    this.source,
    this.servs,
    this.diets,
    this.healths,
    this.ingredients,
    this.calories,
    this.weight,
    this.time,
    this.sugar,
    this.fat,
    this.cholesterol,
    this.proteins,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['label'],
      photo: json['image'],
      url: json['url'],
      shareUrl: json['shareAs'],
      source: json['source'],
      servs: json['yield'],
      diets: json['dietLabel'],
      healths: json['healthLabels'],
      ingredients: json['ingredientLines'],
      calories: json['calories'],
      weight: json['totalWeight'],
      time: json['totalTime'],
      sugar: NutritionalValue.fromJson(json['totalNutrients']['SUGAR']),
      fat: NutritionalValue.fromJson(json['totalNutrients']['FAT']),
      cholesterol: NutritionalValue.fromJson(json['totalNutrients']['CHOLE']),
      proteins: NutritionalValue.fromJson(json['totalNutrients']['PROCNT']),
    );
  }
}

class NutritionalValue {
  final String label;
  final double quantity;
  final String unit;

  NutritionalValue({this.label, this.quantity, this.unit});

  factory NutritionalValue.fromJson(Map<String, dynamic> json) {
    return NutritionalValue(
      label: json['label'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }
}
