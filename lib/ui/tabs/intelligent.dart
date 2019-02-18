import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/intelligent.dart';

class IntelligentTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<IntelligentModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('Intelligent page'),
              centerTitle: true,
            ),
            body: Center(child: const Text('WORK IN PROGRESS')),
          ),
    );
  }
}
