import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainScreen()));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Image.asset('assets/theme.png'),
                title: Text(
                  'Тема',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Text(
                  'Светлая',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {

                },
              ),
              ListTile(
                leading: Image.asset('assets/upload.png'),
                title: Text(
                  'Загрузить фото',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {

                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppBar(onOptionsPressed: _showBottomSheet),
      body: const ImageGrid(),
    );
  }
}

class MainScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onOptionsPressed;

  const MainScreenAppBar({super.key, required this.onOptionsPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 11, 0, 11),
        child: Image.asset('assets/logo.png'),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Image.asset('assets/options.png'),
          onPressed: onOptionsPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 5,
      ),
      itemCount: 40,
      itemBuilder: (context, index) {
        return Image.asset(
          'assets/blurred.png',
          fit: BoxFit.fill,
        );
      },
    );
  }
}
