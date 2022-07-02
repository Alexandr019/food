import 'package:flutter/material.dart';
import 'package:food/main.dart';

const _home = '/home';

class ProjectRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _home:
        return _buildRoute(const MyApp());

      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }
}

enum Routes { home }

extension RoutNames on Routes {
  String get name {
    switch (this) {
      case Routes.home:
        return _home;
    }
  }
}
