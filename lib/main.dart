import 'package:flutter/material.dart';
import 'theme_manager.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeManager.themeMode,
          initialRoute: '/',
          routes: {
            '/': (BuildContext context) => FirstScreen(),
            '/second': (BuildContext context) => const SecondScreen(),
          },
        );
      },
    );
  }
}
