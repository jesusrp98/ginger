import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/item_ginger.dart';
import '../../models/recipe.dart';
import '../../models/search.dart';
import '../../widgets/big_tip.dart';
import '../../widgets/hero_image.dart';
import '../../widgets/list_cell.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/separator.dart';
import '../pages/cocktail.dart';
import '../pages/recipe.dart';
import '../pages/search_filters.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SearchModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    model.mode == Mode.RECIPES
                        ? Icons.restaurant
                        : Icons.local_bar,
                  ),
                  onPressed: () => model.toggleMode(),
                  tooltip: 'Toggle mode',
                ),
                IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: model.mode == Mode.RECIPES
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ScopedModel(
                                    model: model,
                                    child: SearchFiltersPage(),
                                  ),
                              fullscreenDialog: true,
                            ),
                          )
                      : null,
                  tooltip: 'Filters',
                )
              ],
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
                          message: 'Look for recipes or cocktails',
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
                      separatorBuilder: (context, index) =>
                          Separator.divider(height: 0, indent: 88),
                      itemBuilder: (context, index) {
                        final GingerItem item = model.getItem(index);
                        return ListCell(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: HeroImage.list(
                              url: item.photo,
                              tag: item.name,
                            ),
                          ),
                          title: item.name,
                          subtitle: item.subtitle,
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => item is Recipe
                                      ? RecipePage(item)
                                      : CocktailPage(item),
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
