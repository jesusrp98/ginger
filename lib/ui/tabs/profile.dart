import 'package:flutter/material.dart';
import 'package:ginger/widgets/card_main_info.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/app_model.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('Profile page'),
              centerTitle: true,
            ),
            body: model.isLoading
                ? Text("Loading")
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: <Widget>[
                      CardPhoto(
                        url: model.userSettings.url,
                        name: model.userSettings.name,
                      )
                    ]),
                  ),
          ),
    );
  }
}
