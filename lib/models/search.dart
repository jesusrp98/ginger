import 'dart:convert';

import 'package:http/http.dart' as http;

import 'query.dart';
import 'recipe.dart';

class SearchModel extends QueryModel {
  @override
  Future loadData() {
    return null;
  }

  void fetchQuery(String query) async {
    setLoading(true);
    response = await http.get('https://api.edamam.com/search?q=$query&app_id=541602a7&app_key=dc6e03b02796720e83b437f67e6074db&to=20');
    snapshot = json.decode(response.body);

    // For demo purposes
    print(snapshot);
    print('https://api.edamam.com/search?q=$query&app_id=541602a7&app_key=dc6e03b02796720e83b437f67e6074db&to=20');

    clearItems();
    items.addAll(snapshot['hits']
        .map((recipe) => Recipe.fromJson(recipe['recipe']))
        .toList());

    setLoading(false);
  }
}
