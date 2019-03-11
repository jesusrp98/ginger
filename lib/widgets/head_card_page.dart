import 'package:flutter/material.dart';

import 'hero_image.dart';
import 'separator.dart';

class HeadCardPage extends StatelessWidget {
  final String url;
  final String title;
  final Widget subtitle;
  final Widget body;

  HeadCardPage({this.url, this.title, this.subtitle, this.body});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            HeroImage.card(url: url, tag: title),
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
