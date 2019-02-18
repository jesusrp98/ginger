import 'dart:convert';

import 'package:http/http.dart' as http;

import '../util/url.dart';
import 'query.dart';

class HomeModel extends QueryModel {
  @override
  Future loadData() async {
    response = await http.get(Url.sampleEdamam);
    snapshot = json.decode(response.body);

    // For demo purposes
    print(snapshot);
  }
}