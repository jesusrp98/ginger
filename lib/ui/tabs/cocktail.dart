import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/cocktail.dart';
import '../../widgets/card_scroll.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/separator.dart';

class CocktailTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CocktailModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('Cocktails catalogue'),
              centerTitle: true,
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
                              Icons.local_bar,
                              size: 56,
                              color: Theme.of(context).textTheme.caption.color,
                            ),
                            Separator.spacer(width: 16),
                            Expanded(
                              child: Text(
                                'Take a look at the recommended cocktails!',
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
                        CardScroll.cocktail(
                          context: context,
                          title: 'Vodka',
                          children: model.vodkas,
                        ),
                        Separator.cardSpacer(),
                        CardScroll.cocktail(
                          context: context,
                          title: 'Gin',
                          children: model.gins,
                        ),
                        Separator.cardSpacer(),
                        CardScroll.cocktail(
                          context: context,
                          title: 'Rum',
                          children: model.rums,
                        ),
                        Separator.cardSpacer(),
                        CardScroll.cocktail(
                          context: context,
                          title: 'Tequila',
                          children: model.tequilas,
                        ),
                        Separator.cardSpacer(),
                        CardScroll.cocktail(
                          context: context,
                          title: 'Wine',
                          children: model.wines,
                        ),
                        Separator.cardSpacer(),
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.redAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(children: <Widget>[
                              Icon(Icons.warning, size: 56),
                              Separator.spacer(width: 14),
                              Expanded(
                                child: Text(
                                  'Remember not to drink if you\'re going to drive!',
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
