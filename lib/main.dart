import 'package:flutter/material.dart';
import 'package:ginger/models/app_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/screens/about.dart';
import 'ui/screens/start.dart';
import 'ui/screens/welcome.dart';
import 'util/colors.dart';

/// Main app model
final AppModel model = AppModel();

/// Main app method
void main() async {
  model.loadData();
  runApp(GingerApp());
}

class GingerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: model,
      child: MaterialApp(
        title: 'Project: Ginger',
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'ProductSans',
          primaryColor: primaryColor,
          accentColor: accentColor,
        ),
        home: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            //bool newUser = snapshot.data.getBool('newUser') ?? true;

            // return newUser ? WelcomeScreen() : StartScreen();
            return StartScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/about': (_) => AboutScreen(),
        },
      ),
    );
  }
}
