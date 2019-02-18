import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/home.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('Project: Ginger'),
              centerTitle: true,
            ),
            body: Center(child: const Text('WORK IN PROGRESS')),
          ),
    );
  }
}
