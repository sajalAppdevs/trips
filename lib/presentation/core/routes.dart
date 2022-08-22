import 'package:flutter/material.dart';

import '../screens/home.dart';

class Routes {
  const Routes._();

  static const home = "/";
  static const dashboard = "/dashboard";
  static const account = "/account";

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomeScreen(),
  };
}
