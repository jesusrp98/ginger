import 'package:flutter/material.dart';

import '../ui/pages/cocktail.dart';
import '../ui/pages/dialog_cocktails.dart';
import 'hero_image.dart';
import 'separator.dart';

class CardScroll extends StatelessWidget {
  final String title;
  final Widget icon;
  final List children;

  CardScroll({this.title, this.icon, this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  icon,
                  Separator.spacer(width: 14),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Theme.of(context).textTheme.caption.color,
                        ),
                  )
                ]),
                InkResponse(
                  child: Text(
                    'MORE',
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          color: Theme.of(context).accentColor,
                        ),
                  ),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CocktailsDialog(
                                title: title,
                                cocktails: children,
                              ),
                          fullscreenDialog: true,
                        ),
                      ),
                )
              ],
            ),
            Separator.spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: children
                  .sublist(0, 4)
                  .map((cocktail) => Container(
                        height: 91,
                        width: 72,
                        child: InkWell(
                          child: Column(children: <Widget>[
                            Separator.spacer(height: 8),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              child: HeroImage.list(
                                url: cocktail.photo,
                                tag: cocktail.name,
                              ),
                            ),
                            Separator.spacer(height: 8),
                            Text(
                              cocktail.name,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.subhead.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .color,
                                      ),
                            )
                          ]),
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CocktailPage(cocktail),
                                ),
                              ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
