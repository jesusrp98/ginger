import 'package:flutter/material.dart';
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
                ? Center(child: Text('LOADING...'))
                : ListView.separated(
                    itemCount: model.getItemCount,
                    separatorBuilder: (context, index) =>
                        Separator.divider(height: 0, indent: 88),
                    itemBuilder: (context, index) {
                      final Recipe recipe = model.getItem(index);
                      return ListCell(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: HeroImage.list(
                            url: recipe.photo,
                            tag: recipe.name,
                          ),
                        ),
                        title: recipe.name,
                        subtitle: 'Serves ' + recipe.getPeople,
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RecipePage(recipe),
                              ),
                            ),
                      );
                    },
                  ),
          ),
    );
  }
}
