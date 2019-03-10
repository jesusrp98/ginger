import 'package:flutter/material.dart';

import 'hero_image.dart';
import 'separator.dart';

class HeadCardPage extends StatelessWidget {
  final String url;
  final String name;
  final Widget body;

  HeadCardPage({this.url, this.name, this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            HeroImage.card(url: url, tag: name),
            Separator.spacer(width: 14),
            Expanded(
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
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
