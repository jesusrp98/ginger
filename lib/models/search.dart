import 'dart:convert';

import 'package:http/http.dart' as http;

import 'query.dart';
import 'recipe.dart';

final Map<String, dynamic> dietStrings = {
  "diet_type": {
    "Balanced": "balanced",
    "High protein": "high-protein",
    "High fiber": "high-fiber",
    "Low fat": "low-fat",
    "Low carb": "low-carb",
    "Low sodium": "low-sodium"
  },
  "diet_properties": {
    "Vegan": "vegan",
    "Vegetarian": "vegetarian",
    "paleo": "paleo",
    "Dairy free": "dairy-free",
    "Gluten free": "gluten-free",
    "Weat free": "wheat-free",
    "Fat free": "fat-free",
    "Low sugar": "low-sugar",
    "Egg free": "egg-free",
    "Peanut free": "peanut-free",
    "Tree nut free": "tree-nut-free",
    "Soy free": "soy-free",
    "Fish free": "fish-free",
    "Shellfish free": "shellfish-free"
  }
};

class SearchModel extends QueryModel {
  SearchFilter filter = SearchFilter.init();
  bool _success = true;

  @override
  Future loadData() {
    setLoading(false);
  }

  void fetchQuery(String query) async {
    final String url =
        'https://api.edamam.com/search?q=$query&app_id=541602a7&app_key=dc6e03b02796720e83b437f67e6074db&to=20';
    List _result;

    setLoading(true);
    response = await http.get(url);
    snapshot = json.decode(response.body);

    clearItems();
    _result = snapshot['hits'];

    items.addAll(
        _result.map((recipe) => Recipe.fromJson(recipe['recipe'])).toList());

    _success = _result.isNotEmpty;

    setLoading(false);
  }

  bool get onSuccess => _success;

  void setFilterCalories(num calories) {
    filter.totalCalories = calories;
    notifyListeners();
  }

  void setFilterDietProperties(String dietType) {
    filter.dietType = dietType;
    notifyListeners();
  }

  void setFilterDietType(String dietProperties) {
    filter.dietProperties = dietProperties;
    notifyListeners();
  }

  void setFilterTime(num time) {
    filter.time = time;
    notifyListeners();
  }

  void setFilterIngredients(int ingredients) {
    filter.ingredients = ingredients;
    notifyListeners();
  }
}

class SearchFilter {
  num totalCalories;
  String dietType;
  String dietProperties;
  num time;
  int ingredients;

  SearchFilter({
    this.totalCalories,
    this.dietType,
    this.dietProperties,
    this.time,
    this.ingredients,
  });

  factory SearchFilter.init() {
    return SearchFilter(
      totalCalories: 2000,
      dietType: 'balanced',
      dietProperties: 'low-sugar',
      time: 30,
      ingredients: 2,
    );
  }

  String get getCalories => '${totalCalories.toString()} kcal';

  String get getTime => '$time min';

  String get getIngredients => '$ingredients ingredients';
}
