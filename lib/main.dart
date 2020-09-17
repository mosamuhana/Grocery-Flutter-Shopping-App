import 'package:flutter/material.dart';

import 'src/routes.dart';
import 'src/services.dart';
import 'src/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}
