import 'dart:convert';

import 'package:http/http.dart' as http;

import 'query.dart';
import 'recipe.dart';

class SearchModel extends QueryModel {
  bool _success = true;

  @override
  Future loadData() {
    setLoading(false);
  }

  void fetchQuery(String query) async {
    final String url = 'https://api.edamam.com/search?q=$query&app_id=541602a7&app_key=dc6e03b02796720e83b437f67e6074db&to=20';
    List _result;

    setLoading(true);
    response = await http.get(url);
    snapshot = json.decode(response.body);

    clearItems();
    _result = snapshot['hits'];

    items.addAll(_result
        .map((recipe) => Recipe.fromJson(recipe['recipe']))
        .toList());
    
    _success = _result.isNotEmpty;

    setLoading(false);
  }

  bool get onSuccess => _success;
}
