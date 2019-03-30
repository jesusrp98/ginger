import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'hero_image.dart';
import 'separator.dart';

/// HEAD CARD PAGE WIDGET
/// Widget used as page head in details pages, like 'Recipe Page' or 'Cocktail Page'.
class HeadCardPage extends StatelessWidget {
  final String title, imageUrl;
  final Widget subtitle, body;

  HeadCardPage({
    @required this.title,
    @required this.imageUrl,
    @required this.subtitle,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            HeroImage.card(
              url: imageUrl,
              tag: title,
              onTap: () async => await FlutterWebBrowser.openWebPage(
                    url: imageUrl,
                    androidToolbarColor: Theme.of(context).primaryColor,
                  ),
            ),
            Separator.spacer(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Separator.spacer(height: 11),
                  subtitle,
                ],
              ),
            ),
          ]),
          Separator.divider(),
          body,
        ]),
      ),
    );
  }
}
