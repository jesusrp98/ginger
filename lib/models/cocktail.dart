import '../util/url.dart';
import 'query.dart';

/// COCKTAIL MODEL
/// This model contais all cocktails the app offers
/// to its user by default, like vodka or rum drinks.
class CocktailModel extends QueryModel {
  List _auxList = List();

  @override
  Future loadData() async {
    // Loads all cocktails containing a specific ingredient
    for (String url in Url.sampleCocktails) {
      // Fetch cocktail from the URL
      Map cocktails = await fetchData(url);
      _auxList.clear();

      // Loads each specific cocktail from its id
      for (Map baseCocktail in cocktails['drinks']) {
        Map cocktail = await fetchData(
          Url.cocktailBaseUrl,
          parameters: {'i': baseCocktail['idDrink']},
        );

        // Adds that cocktail to an aux list
        _auxList.add(Cocktail.fromJson(cocktail['drinks'][0]));
      }
      // Adds that aux list to the main list
      items.add(_auxList);
    }
    setLoading(false);
  }

  // Getters which retrieves a specific cocktails list
  List get vodkas => getItem(0);

  List get gins => getItem(1);

  List get rums => getItem(2);

  List get tequilas => getItem(3);

  List get wines => getItem(4);
}

class Cocktail {
  final String name, tag, glassType, instructions, photo;
  final List<CocktailIngredient> ingredients;
  final bool isAlcoholic;

  Cocktail({
    this.name,
    this.tag,
    this.glassType,
    this.instructions,
    this.photo,
    this.ingredients,
    this.isAlcoholic,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      name: json['strDrink'],
      tag: json['strIBA'],
      glassType: json['strGlass'],
      isAlcoholic: json['strAlcoholic'] == 'Alcoholic',
      instructions: json['strInstructions'],
      photo: json['strDrinkThumb'],
      ingredients: [
        CocktailIngredient(
          name: json['strIngredient1'],
          measure: json['strMeasure1'],
        ),
        CocktailIngredient(
          name: json['strIngredient2'],
          measure: json['strMeasure2'],
        ),
        CocktailIngredient(
          name: json['strIngredient3'],
          measure: json['strMeasure3'],
        ),
        CocktailIngredient(
          name: json['strIngredient4'],
          measure: json['strMeasure4'],
        ),
      ],
    );
  }

  String get getTag => tag ?? 'Unknown';

  String get getGlass => glassType ?? 'Unknown';

  String get getInstructions =>
      instructions ?? 'There are no instructions provided';

  List get getIngredients => ingredients
    ..removeWhere((CocktailIngredient ingredient) => ingredient.name == null);
}

class CocktailIngredient {
  final String name, measure;

  CocktailIngredient({this.name, this.measure});

  String get getMeasure => measure.isNotEmpty ? measure : '-';
}
