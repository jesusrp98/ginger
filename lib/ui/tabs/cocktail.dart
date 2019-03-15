import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/cocktail.dart';
import '../../widgets/hero_image.dart';
import '../../widgets/list_cell.dart';
import '../../widgets/separator.dart';
import '../pages/cocktail.dart';

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
                    separatorBuilder: (context, index) =>
                        Separator.divider(height: 0, indent: 88),
                    itemBuilder: (_, index) {
                      final Cocktail cocktail = model.getItem(index);
                      return ListCell(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: HeroImage.list(
                            url: cocktail.photo,
                            tag: cocktail.name,
                          ),
                        ),
                        title: cocktail.name,
                        subtitle: cocktail.glassType,
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CocktailPage(cocktail),
                              ),
                            ),
                      );
                    },
                  ),
          ),
    );
  }
}
