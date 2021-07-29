import 'package:flutter/material.dart';

import 'pages/home.dart' as homePage;
import 'pages/login.dart' as loginPage;

Map<String, WidgetBuilder> pageRoutes = {
  '/': (BuildContext context) => homePage.MyHomePage(),
  '/home': (BuildContext context) => homePage.MyHomePage(),
  '/login': (BuildContext context) => loginPage.MyLoginPage(),
};
