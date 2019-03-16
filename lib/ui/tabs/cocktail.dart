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
                      padding: const EdgeInsets.all(8),
                      child: Column(children: <Widget>[
                        CardScroll(
                          title: 'Gin',
                          icon: Icon(
                            Icons.picture_as_pdf,
                            size: 27,
                            color: Theme.of(context).textTheme.caption.color,
                          ),
                          children: model.items,
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
