import 'package:flutter/material.dart';
import 'package:ginger/models/recipe.dart';
import 'package:ginger/widgets/row_item.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              leading: SizedBox(
                height: 64,
                width: 64,
                child: Image.network(url),
              ),
              title: Text(name),
            ),
          ],
        ),
      ),
    );
  }
}
