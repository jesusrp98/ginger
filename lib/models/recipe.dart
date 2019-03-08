class Recipe {
  final String name, photo, url, shareUrl, source;
  final List healths, ingredients, diets;
  final double servs, calories, weight, time;
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
      diets: json['dietLabels'],
      healths: json['healthLabels'],
      ingredients: json['ingredientLines'],
      calories: json['calories'],
      weight: json['totalWeight'],
      time: json['totalTime'],
      sugar: setNutritionalValue(json['totalNutrients']['SUGAR']),
      fat: setNutritionalValue(json['totalNutrients']['FAT']),
      cholesterol: setNutritionalValue(json['totalNutrients']['CHOLE']),
      proteins: setNutritionalValue(json['totalNutrients']['PROCNT']),
    );
  }
  
  static NutritionalValue setNutritionalValue(
    Map<String, dynamic> nutritionalValue,
  ) {
    try {
      return NutritionalValue.fromJson(nutritionalValue);
    } catch (_) {
      return null;
    }
  }
}

class NutritionalValue {
  final String label, unit;
  final double quantity;

  NutritionalValue({this.label, this.quantity, this.unit});

  factory NutritionalValue.fromJson(Map<String, dynamic> json) {
    return NutritionalValue(
      label: json['label'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }
}
