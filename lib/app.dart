import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
    );
  }
}
