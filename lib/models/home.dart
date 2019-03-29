import '../util/url.dart';
import 'query.dart';
import 'recipe.dart';

/// HOME MODEL
/// This model contais all recipes the app offers
/// to its user by default, like balanced or low-fat recipes.
class HomeModel extends QueryModel {
  List _auxList = List();

  @override
  Future loadData() async {
    // Loads all recipes from a single URL
    for (String url in Url.sampleRecipes) {
      // Fetch recipes from the URL
      Map recipes = await fetchData(url);
      _auxList.clear();

      // Adds all fetched recipes to an aux list
      for (Map recipe in recipes['hits'])
        _auxList.add(Recipe.fromJson(recipe['recipe']));

      // Adds that aux list to the main list
      items.add(_auxList);
    }
    setLoading(false);
  }

  List get balanced => getItem(0);

  List get proteins => getItem(1);

  List get fat => getItem(2);

  List get carb => getItem(3);
}
