import 'package:flutter/material.dart';

import 'hero_image.dart';
import 'separator.dart';

class CardPhoto extends StatelessWidget {
  final String url;
  final String name;

  CardPhoto({
    this.url,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: <Widget>[
            HeroImage.card(url: url, tag: name),
            Separator.spacer(width: 14, height: 0),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
