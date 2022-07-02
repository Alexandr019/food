import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/project_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      locale: const Locale('az'),
      title: 'Food',
      initialRoute: Routes.food.name,
      onGenerateRoute: ProjectRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
