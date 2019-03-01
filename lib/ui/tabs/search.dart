import 'package:flutter/material.dart';
import 'package:ginger/models/recipe.dart';
import 'package:ginger/ui/pages/recipe.dart';
import 'package:ginger/widgets/loading_indicator.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/search.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SearchModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                onFieldSubmitted: (string) => model.fetchQuery(string),
                decoration: InputDecoration(
                  icon: const Icon(Icons.search),
                  fillColor: Colors.red,
                  labelText: 'Search',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                ),
              ),
            ),
            body: model.isLoading
                ? LoadingIndicator()
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
