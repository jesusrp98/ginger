import 'package:flutter/material.dart';
import 'package:ginger/models/recipe.dart';
import 'package:ginger/ui/pages/recipe.dart';
import 'package:ginger/ui/tabs/big_tip.dart';
import 'package:ginger/widgets/loading_indicator.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/search.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SearchModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: TextField(
                autofocus: false,
                onSubmitted: (string) =>
                    string.isNotEmpty ? model.fetchQuery(string) : null,
                decoration: InputDecoration(
                  hintText: 'Search recipes or cocktails',
                  labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.subhead.color,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).textTheme.caption.color,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            body: Builder(
              builder: (context) {
                if (model.isLoading) {
                  return LoadingIndicator();
                } else {
                  if (model.items.isEmpty) {
                    if (model.onSuccess)
                      return Center(
                        child: BigTip(
                          icon: Icons.search,
                          message: 'Start tying',
                        ),
                      );
                    else
                      return Center(
                        child: BigTip(
                          icon: Icons.sentiment_dissatisfied,
                          message: 'We couldn\'t find anything',
                        ),
                      );
                  } else {
                    return ListView.separated(
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
                    );
                  }
                }
              },
            ),
          ),
    );
  }
}
