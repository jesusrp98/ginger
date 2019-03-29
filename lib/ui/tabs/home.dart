import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/home.dart';
import '../../widgets/card_scroll.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/separator.dart';

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
                      padding: const EdgeInsets.all(16),
                      child: Column(children: <Widget>[
                        RecipesScroll(
                          title: 'Balanced',
                          children: model.balanced,
                        ),
                        Separator.cardSpacer(),
                        RecipesScroll(
                          title: 'High Proteins',
                          children: model.proteins,
                        ),
                        Separator.cardSpacer(),
                        RecipesScroll(
                          title: 'Low Fat',
                          children: model.fat,
                        ),
                        Separator.cardSpacer(),
                        RecipesScroll(
                          title: 'Low Carb',
                          children: model.carb,
                        ),
                      ]),
                    )
                  ]),
          ),
    );
  }
}
