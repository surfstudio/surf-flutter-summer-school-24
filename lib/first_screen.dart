import 'package:flutter/material.dart';
import 'theme_manager.dart';
import 'package:provider/provider.dart';

const String mainScreen = "assets/main_screen.jpg";

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CatsProfessions",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _ThemeSwitcher();
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/second');
          },
          child: SizedBox(
            width: 500,
            height: 700,
            child: Image.asset(
              mainScreen,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    bool _isDarkTheme = themeManager.themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            title: Text("Темная тема"),
            value: _isDarkTheme,
            onChanged: (value) {
              themeManager.toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}
