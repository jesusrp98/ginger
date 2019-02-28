import 'package:flutter/material.dart';
import 'package:ginger/widgets/card_page.dart';
import 'package:ginger/widgets/row_item.dart';

import '../../models/recipe.dart';

class RecipePage extends StatelessWidget {
  final Recipe _recipe;

  RecipePage(this._recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample recipe'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_recipe.name, style: Theme.of(context).textTheme.title),
            SizedBox(height: 8),
            Text(
              'Delicious...',
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Theme.of(context).textTheme.caption.color),
            ),
            RowItem.textRow(context, 'title', 'descr'),
            CardPage(title: 'titñle', body: loquesea,),
          ],
        ),
      ),
    );
  }
}
