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
    'https://api.edamam.com/search?q=tomato&app_id=541602a7&app_key=dc6e03b02796720e83b437f67e6074db&diet=balanced',
    'https://api.edamam.com/search?q=chicken&app_id=541602a7&app_key=dc6e03b02796720e83b437f67e6074db%20&diet=high-protein',
    'https://api.edamam.com/search?q=legumes&app_id=541602a7&app_key=dc6e03b02796720e83b437f67e6074db&diet=low-fat',
    'https://api.edamam.com/search?q=salad&app_id=541602a7&app_key=dc6e03b02796720e83b437f67e6074db&diet=low-carb',
  ];
}
