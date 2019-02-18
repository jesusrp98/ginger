import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/search.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<SearchModel>(
      builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              title: const Text('Search recipes'),
              centerTitle: true,
            ),
            body: Center(child: const Text('WORK IN PROGRESS')),
          ),
    );
  }
}
