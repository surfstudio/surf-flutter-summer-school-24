import 'package:flutter/material.dart';
import 'package:postogram/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
    );
  }
}
