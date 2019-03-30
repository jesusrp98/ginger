import 'package:intl/intl.dart';

/// RECIPE MODEL
/// This model holds all info about a specific model.
/// It includes name, image, nutritional values...
class Recipe {
  final String name, photo, url, shareUrl, source;
  final List healths, ingredients, diets;
  final double servs, calories, weight, time;
  final List nutritionalValues;

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
    this.nutritionalValues,
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
      nutritionalValues: [
        setNutritionalValue(json['totalNutrients']['SUGAR']),
        setNutritionalValue(json['totalNutrients']['FAT']),
        setNutritionalValue(json['totalNutrients']['CHOLE']),
        setNutritionalValue(json['totalNutrients']['PROCNT'])
      ]..retainWhere((item) => item != null),
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

  String get getCalories => '${calories.round()} kcal';

  String get getPeople =>
      '${NumberFormat.decimalPattern().format(servs)} ${servs == 1 ? 'person' : 'people'}';

  String get displayPeople => 'For $getPeople';

  String get getPreparationTime {
    if (time == 0)
      return 'Not specified';
    else if (time < 60)
      return '${NumberFormat.decimalPattern().format(time)} min';
    else
      return '${NumberFormat.decimalPattern().format(time / 60)} h';
  }

  bool get isVegetarian => hasLabel('Vegeterian');

  bool get isVegan => hasLabel('Vegan');

  bool hasLabel(String label) => healths.contains(label);

  String get getDiet {
    String auxString = '';

    healths.forEach(
      (item) => auxString += item + ((healths.last == item) ? '' : '\n'),
    );

    return auxString;
  }
}

/// NUTRITIONAL VALUE
/// This model holds information about a specific nut. value,
/// like its name, unit & quantity.
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

  String get getLabel => label;

  String get getInfo => '${quantity.round()} $unit';
}
