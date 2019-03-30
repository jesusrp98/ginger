import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/profile.dart';
import '../../widgets/big_tip.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProfileModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('My profile'),
              centerTitle: true,
            ),
            body: Center(
              child: BigTip(
                icon: Icons.error_outline,
                message: 'This screen is under construction',
              ),
            ),
          ),
    );
  }
}
