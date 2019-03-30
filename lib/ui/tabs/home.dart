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
              title: const Text('Recipe recommendations'),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.info_outline),
                  tooltip: 'About',
                  onPressed: () => Navigator.pushNamed(context, '/about'),
                )
              ],
            ),
            body: model.isLoading
                ? LoadingIndicator()
                : ListView(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.restaurant,
                              size: 56,
                              color: Theme.of(context).textTheme.caption.color,
                            ),
                            Separator.spacer(width: 16),
                            Expanded(
                              child: Text(
                                'Take a look at the recommended recipes!',
                                style:
                                    Theme.of(context).textTheme.title.copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .color,
                                        ),
                              ),
                            )
                          ],
                        ),
                        Separator.divider(),
                        CardScroll.recipe(
                          context: context,
                          title: 'Balanced',
                          children: model.balanced,
                        ),
                        Separator.cardSpacer(),
                        CardScroll.recipe(
                          context: context,
                          title: 'High Proteins',
                          children: model.proteins,
                        ),
                        Separator.cardSpacer(),
                        CardScroll.recipe(
                          context: context,
                          title: 'Low Carb',
                          children: model.carb,
                        ),
                        Separator.cardSpacer(),
                        CardScroll.recipe(
                          context: context,
                          title: 'Low Fat',
                          children: model.fat,
                        ),
                      ]),
                    )
                  ]),
          ),
    );
  }
}
