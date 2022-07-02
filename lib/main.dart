import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/food_page.dart';
import 'package:food/project_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO create file with routes
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      locale: const Locale('az'),
      title: 'Food',
      initialRoute: Routes.home.name,
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const FoodPage(),
      },
    );
  }
}
