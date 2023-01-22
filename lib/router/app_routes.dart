import 'package:flutter/material.dart';

import 'package:movies/screens/screens.dart';

class AppRoutes {

  static const String initialRoute = HomeScreen.routeName;

  static final Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName    : (_) => HomeScreen(),
    DetailsScreen.routeName : (_) => DetailsScreen()
  }; 

}