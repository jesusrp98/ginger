import 'package:flutter/material.dart';

import 'ui/screens/about.dart';
import 'ui/screens/start.dart';
import 'util/colors.dart';

void main() => runApp(GingerApp());

class GingerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project: Ginger',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'ProductSans',
        primaryColor: primaryColor,
        accentColor: accentColor,
      ),
      home: StartScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/about': (_) => AboutScreen(),
      },
    );
  }
}
