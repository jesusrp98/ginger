import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/home.dart';
import '../../models/recipe.dart';
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
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final Recipe recipe = model.getItem(index);
                      return ListTile(
                        leading: SizedBox(
                          height: 64,
                          width: 64,
                          child: Image.network(recipe.photo),
                        ),
                        title: Text(recipe.name),
                        subtitle: Text(recipe.servs.toString()),
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    RecipePage(recipe),
                              ),
                            ),
                      );
                    }),
          ),
    );
  }
}
