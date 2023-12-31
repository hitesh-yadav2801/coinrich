import 'package:coinrich/presentations/screens/home_screen.dart';
import 'package:coinrich/presentations/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../data/models/fetch_coins_model.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen(coins: settings.arguments as List<DataModel>));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
