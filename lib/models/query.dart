import 'dart:async';

import 'package:scoped_model/scoped_model.dart';

abstract class QueryModel extends Model {
  List _items = List();

  var snapshot;
  var response;

  bool _loading = true;

  Future refresh() async {
    await loadData();
    notifyListeners();
  }

  void setLoading(bool state) {
    _loading = state;
    notifyListeners();
  }

  Future loadData();

  List get items => _items;

  dynamic getItem(index) => _items[index];

  int get getItemCount => _items.length;

  bool get isLoading => _loading;

  clearItems() => _items.clear();
}
