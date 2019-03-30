import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/intelligent.dart';
import '../../widgets/big_tip.dart';

class IntelligentTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<IntelligentModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('My daily stats'),
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
