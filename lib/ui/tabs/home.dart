import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/home.dart';
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
                    itemBuilder: (context, index) => ListTile(
                          title: Text(model.getItem(index).name),
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RecipePage(model.getItem(index)),
                                ),
                              ),
                        ),
                  ),
          ),
    );
  }
}
