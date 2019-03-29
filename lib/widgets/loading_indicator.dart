import 'package:flutter/material.dart';

import 'separator.dart';

/// LOADING INDICATOR WIDGET
/// Generic widget to alert user that content is being loaded.
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Separator.spacer(height: 16),
          Text(
            'This could take a while...',
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: Theme.of(context).textTheme.caption.color),
          )
        ],
      ),
    );
  }
}
