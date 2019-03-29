import 'dart:convert';

import 'package:http/http.dart' as http;

import '../util/url.dart';
import 'query.dart';
import 'recipe.dart';

class HomeModel extends QueryModel {
  List _auxList;
  @override
  Future loadData() async {
    for (String url in Url.sampleRecipes) {
      _auxList = List();
      response = await http.get(url);
      snapshot = json.decode(response.body);

      // Loads each specific cocktail from its id
      for (var baseRecipe in snapshot['hits']) {
        // Adds that drink to an aux list
        _auxList.add(Recipe.fromJson(baseRecipe['recipe']));
       }
      items.add(_auxList);
    }
    // Adds that aux list to the main list
    setLoading(false);
  }

  List get balanced => getItem(0);

  List get proteins => getItem(1);

  List get fat => getItem(2);

  List get carb => getItem(3);

}