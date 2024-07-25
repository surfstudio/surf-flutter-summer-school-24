import 'package:flutter/material.dart';
import 'footer_menu.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final String logoAsset =
        isDarkMode ? "assets/logo-light.png" : "assets/logo.png";

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          title: Image(
            image: AssetImage(logoAsset),
            width: 180,
            height: 70,
            fit: BoxFit.contain,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              iconSize: 40,
              icon: const Icon(
                Icons.more_vert_outlined,
                size: 40  ,
              ),
              onPressed: () {
                _showBottomMenu(context);
              },
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  void _showBottomMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      elevation: 5,
      builder: (BuildContext context) {
        return const FooterMenu();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight);
}
