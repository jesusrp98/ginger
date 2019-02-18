import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/cocktail.dart';

class CocktailTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CocktailModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('Cocktails catalogue'),
              centerTitle: true,
            ),
            body: Center(child: const Text('WORK IN PROGRESS')),
          ),
    );
  }
}
