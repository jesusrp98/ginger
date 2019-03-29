import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/search.dart';
import '../../widgets/separator.dart';

class SearchFiltersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SearchModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(title: Text('Search filters'), centerTitle: true),
            body: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Total calories'),
                  subtitle: Text(model.filter.displayCalories),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Picker(
                        adapter: NumberPickerAdapter(data: [
                          NumberPickerColumn(
                            begin: 50,
                            end: 500,
                            jump: 50,
                            initValue: model.filter.totalCalories[0],
                          ),
                          NumberPickerColumn(
                            begin: 50,
                            end: 500,
                            jump: 50,
                            initValue: model.filter.totalCalories[1],
                          ),
                        ]),
                        hideHeader: true,
                        title: Text('Calories', textAlign: TextAlign.center),
                        onConfirm: (picker, list) =>
                            model.setFilterCalories(picker.getSelectedValues()),
                        confirmText: 'OK',
                        cancelText: 'CANCEL',
                      ).showDialog(context),
                ),
                Separator.divider(indent: 16, height: 0),
                ListTile(
                  title: Text('Diet type'),
                  subtitle: Text(model.filter.dietType),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Picker(
                        adapter: PickerDataAdapter<String>(
                          pickerdata: dietStrings['diet_type'],
                        ),
                        hideHeader: true,
                        title: Text('Diet type', textAlign: TextAlign.center),
                        onConfirm: (picker, list) => model.setFilterDietType(
                              picker.getSelectedValues()[0],
                            ),
                        confirmText: 'OK',
                        cancelText: 'CANCEL',
                      ).showDialog(context),
                ),
                Separator.divider(indent: 16, height: 0),
                ListTile(
                  title: Text('Diet properties'),
                  subtitle: Text(model.filter.dietProperties),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Picker(
                        adapter: PickerDataAdapter<String>(
                          pickerdata: dietStrings['health_labels'],
                        ),
                        hideHeader: true,
                        title: Text(
                          'Diet properties',
                          textAlign: TextAlign.center,
                        ),
                        onConfirm: (picker, list) =>
                            model.setFilterDietProperties(
                              picker.getSelectedValues()[0],
                            ),
                        confirmText: 'OK',
                        cancelText: 'CANCEL',
                      ).showDialog(context),
                ),
                Separator.divider(indent: 16, height: 0),
                ListTile(
                  title: Text('Total duration'),
                  subtitle: Text(model.filter.getTime),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Picker(
                        adapter: NumberPickerAdapter(data: [
                          NumberPickerColumn(
                            begin: 10,
                            end: 180,
                            jump: 10,
                            initValue: model.filter.time,
                          ),
                        ]),
                        hideHeader: true,
                        title: Text('Duration', textAlign: TextAlign.center),
                        onConfirm: (picker, list) =>
                            model.setFilterTime(picker.getSelectedValues()[0]),
                        confirmText: 'OK',
                        cancelText: 'CANCEL',
                      ).showDialog(context),
                ),
                Separator.divider(indent: 16, height: 0),
                ListTile(
                  title: Text('Number of ingredients'),
                  subtitle: Text(model.filter.getIngredients),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () => Picker(
                        adapter: NumberPickerAdapter(data: [
                          NumberPickerColumn(
                            begin: 1,
                            end: 10,
                            initValue: model.filter.ingredients,
                          ),
                        ]),
                        hideHeader: true,
                        title: Text('Ingredients', textAlign: TextAlign.center),
                        onConfirm: (picker, list) => model.setFilterIngredients(
                              picker.getSelectedValues()[0],
                            ),
                        confirmText: 'OK',
                        cancelText: 'CANCEL',
                      ).showDialog(context),
                ),
                Separator.divider(indent: 16, height: 0),
              ],
            ),
          ),
    );
  }
}
