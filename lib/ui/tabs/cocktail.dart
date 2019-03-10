import 'package:flutter/material.dart';
import 'package:ginger/ui/pages/cocktail.dart';
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
            body: model.isLoading
                ? Text('LOADING...')
                : ListView.separated(
                    itemCount: model.getItemCount,
                    itemBuilder: (_, index) {
                      final Cocktail cocktail = model.getItem(index);
                      return ListTile(
                        leading: SizedBox(
                          height: 64,
                          width: 64,
                          child: Image.network(cocktail.photo),
                        ),
                        title: Text(cocktail.name),
                        subtitle: Text(cocktail.glassType),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CocktailPage(cocktail),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => Divider(),
                  ),
          ),
    );
  }
}
