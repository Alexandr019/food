import 'package:flutter/material.dart';
import 'package:food/food_page.dart';

const _food = '/food';

class ProjectRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _food:
        return _buildRoute(const FoodPage());

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

enum Routes { food }

extension RoutNames on Routes {
  String get name {
    switch (this) {
      case Routes.food:
        return _food;
    }
  }
}
