import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';

class PostogramApp extends StatefulWidget {
  const PostogramApp({super.key});

  @override
  State<PostogramApp> createState() => _PostogramAppState();
}

class _PostogramAppState extends State<PostogramApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.black;
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true
      ),
      routerConfig: _router.config(),
    );
  }
}