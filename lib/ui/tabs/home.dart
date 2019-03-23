import 'package:flutter/material.dart';
import 'package:ginger/widgets/card_scroll.dart';
import 'package:ginger/widgets/loading_indicator.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/home.dart';
import '../../models/recipe.dart';
import '../../widgets/hero_image.dart';
import '../../widgets/list_cell.dart';
import '../../widgets/separator.dart';
import '../pages/recipe.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('Project: Ginger'),
              centerTitle: true,
            ),
        body: model.isLoading
            ? LoadingIndicator()
            : ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: <Widget>[
              RecipesScroll(
                title: 'Balanced',
                children: model.balanced,
              ),
              RecipesScroll(
                title: 'High Proteins',
                children: model.proteins,
              ),
              RecipesScroll(
                title: 'Low Fat',
                children: model.fat,
              ),
              RecipesScroll(
                title: 'Low Carb',
                children: model.carb,
              ),
              Card(
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(children: <Widget>[
                    Icon(Icons.warning, size: 56),
                    Separator.spacer(width: 14),
                    Expanded(
                      child: Text(
                        'Remember not to eat too much!',
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.title,
                      ),
                    )
                  ]),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
