import '../util/url.dart';
import 'query.dart';
import 'recipe.dart';

final Map<String, dynamic> dietStrings = {
  "diet_type": [
    "balanced",
    "high-protein",
    "high-fiber",
    "low-fat",
    "low-carb",
    "low-sodium"
  ],
  "health_labels": [
    "alcohol-free",
    "celery-free",
    "crustacean-free",
    "dairy-free",
    "egg-free",
    "fish-free",
    "gluten-free",
    "kidney-friendly",
    "kosher",
    "low-potassium",
    "lupine-free",
    "mustard-free",
    "No-oil-added",
    "low-sugar",
    "paleo",
    "peanut-free",
    "pescatarian",
    "pork-free",
    "red-meat-free",
    "sesame-free",
    "shellfish-free",
    "soy-free",
    "sugar-conscious",
    "tree-nut-free",
    "vegan",
    "vegetarian",
    "wheat-free"
  ]
};

/// SEARCH MODEL
/// This model allows users to use the Search feature.
/// It can filter the search result as well.
class SearchModel extends QueryModel {
  SearchFilter filter = SearchFilter.init();
  bool _success = true;

  @override
  Future loadData() async => setLoading(false);

  void fetchQuery(String query) async {
    setLoading(true);

    Map result = await fetchData(Url.recipesSearch, parameters: {
      'q': query,
      'app_id': '541602a7',
      'app_key': 'dc6e03b02796720e83b437f67e6074db',
      'calories': filter.getCalories,
      'ingr': filter.ingredients,
      'diet': filter.dietType,
      'health': filter.dietProperties,
      'time': filter.time
    });

    clearItems();

    items.addAll(
      result['hits']
          .map((recipe) => Recipe.fromJson(recipe['recipe']))
          .toList(),
    );

    _success = items.isNotEmpty;

    setLoading(false);
  }

  bool get onSuccess => _success;

  void setFilterCalories(List<int> calories) {
    filter.totalCalories = calories;
    notifyListeners();
  }

  void setFilterDietType(String dietType) {
    filter.dietType = dietType;
    notifyListeners();
  }

  void setFilterDietProperties(String dietProperties) {
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
  List<int> totalCalories;
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
      totalCalories: [50, 150],
      dietType: 'balanced',
      dietProperties: 'sugar-conscious',
      time: 30,
      ingredients: 10,
    );
  }

  String get getCalories =>
      '${totalCalories[0].toString()}-${totalCalories[1].toString()}';

  String get displayCalories => '$getCalories kcal';

  String get getTime => '$time min';

  String get getIngredients => 'Max $ingredients ingredients';
}
