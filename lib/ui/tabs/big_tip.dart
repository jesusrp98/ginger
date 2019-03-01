import 'package:flutter/material.dart';
import 'package:ginger/widgets/separator.dart';

class BigTip extends StatelessWidget {
  final IconData icon;
  final String message;

  BigTip({this.icon, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100,
          color: Theme.of(context).textTheme.caption.color,
        ),
        Separator.spacer(height: 16.0),
        Text(
          message,
          style: Theme.of(context).textTheme.subhead,
        ),
      ],
    );
  }
}
