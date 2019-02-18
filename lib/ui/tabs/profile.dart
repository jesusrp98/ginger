import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/profile.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProfileModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('Profile page'),
              centerTitle: true,
            ),
            body: Center(child: const Text('WORK IN PROGRESS')),
          ),
    );
  }
}
