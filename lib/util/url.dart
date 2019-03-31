/// URL FILE
/// It has all urls used in the app as static const strings.
class Url {
  // Fetch cocktails by ID
  static const String cocktailBaseUrl =
      'https://www.thecocktaildb.com/api/json/v1/1/lookup.php';

  // This URLs are used in the Search tab
  static const String recipesSearch = 'https://api.edamam.com/search';
  static const String cocktailsSearch =
      'https://www.thecocktaildb.com/api/json/v1/1/search.php';

  // This URL presents users with default recipes & cocktails selected by us
  static const List<String> sampleCocktails = [
    'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka',
    'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin',
    'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Rum',
    'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Tequila',
    'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Wine'
  ];
  static const List<String> sampleRecipes = [
    'https://api.edamam.com/search?q=tomato&app_id=79c94935&app_key=8f8b4441a7755a5a34b1b8ef72550062&diet=balanced',
    'https://api.edamam.com/search?q=chicken&app_id=79c94935&app_key=8f8b4441a7755a5a34b1b8ef72550062%20&diet=high-protein',
    'https://api.edamam.com/search?q=legumes&app_id=79c94935&app_key=8f8b4441a7755a5a34b1b8ef72550062&diet=low-fat',
    'https://api.edamam.com/search?q=salad&app_id=79c94935&app_key=8f8b4441a7755a5a34b1b8ef72550062&diet=low-carb',
  ];

  // About page
  static const String authorStore =
      'https://play.google.com/store/apps/developer?id=Jes%C3%BAs+Rodr%C3%ADguez+P%C3%A9rez';
  static const String gingerStore =
      'https://play.google.com/store/apps/details?id=com.chechu.ginger';
  static const String gingerGithub = 'https://github.com/jesusrp98/ginger';
  static const Map<String, String> email = {
    'subject': 'About Project: Ginger',
    'address': 'jesusillorp98@gmail.com',
  };
  static const String flutterPage = 'https://flutter.dev/';
}
