import '../util/url.dart';
import 'cocktail.dart';
import 'query.dart';
import 'recipe.dart';

// Possible search modes
enum Mode { RECIPES, COCKTAILS }

// Lists with possible health & diet labels
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
    "dairy-free",
    "egg-free",
    "fish-free",
    "gluten-free",
    "low-sugar",
    "paleo",
    "peanut-free",
    "shellfish-free",
    "soy-free",
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

  Mode mode = Mode.RECIPES;
  Map _result;

  bool _success = true;

  @override
  Future loadData() async => setLoading(false);

  void fetchQuery(String query) async {
    // Starts loading data
    setLoading(true);

    // Checks which search mode is enabled
    if (mode == Mode.RECIPES) {
      // Model fetches the data
      _result = await fetchData(Url.recipesSearch, parameters: {
        'q': query,
        'app_id': '541602a7',
        'app_key': 'dc6e03b02796720e83b437f67e6074db',
        'calories': filter.getCalories,
        'ingr': filter.ingredients,
        'diet': filter.dietType,
        'healt': filter.dietProperties,
        'time': filter.time
      });

      // Then cleans all items and adds the new ones
      clearItems();
      items.addAll(
        _result['hits']
            .map((recipe) => Recipe.fromJson(recipe['recipe']))
            .toList(),
      );
    } else {
      // Model fetches the data
      _result = await fetchData(Url.cocktailsSearch, parameters: {'s': query});

      // Then cleans all items and adds the new ones
      clearItems();
      items.addAll(
        _result['drinks']
            .map((cocktail) => Cocktail.fromJson(cocktail))
            .toList(),
      );
    }

    // Finishes loading data
    _success = items.isNotEmpty;
    setLoading(false);
  }

  bool get onSuccess => _success;

  toggleMode() {
    mode = mode == Mode.RECIPES ? Mode.COCKTAILS : Mode.RECIPES;
    notifyListeners();
  }

  // Setters which update filter options
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

/// SEARCH FILTER CLASS
/// This class is where the model storages 
/// filter details about recipes.
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
      dietProperties: 'low-sugar',
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
