import 'package:flutter/material.dart';

import 'hero_image.dart';
import 'separator.dart';

class CardPhoto extends StatelessWidget {
  final String url;
  final String name;
  final Widget body;

  CardPhoto({this.url, this.name, this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            HeroImage.card(url: url, tag: name),
            Separator.spacer(width: 14),
            Expanded(
              child: Text(
                name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
