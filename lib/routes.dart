import 'package:flutter/material.dart';

import 'pages/home.dart' as homePage;

Map<String, WidgetBuilder> pageRoutes = {
  '/': (BuildContext context) => homePage.MyHomePage(),
  '/home': (BuildContext context) => homePage.MyHomePage(),
};
