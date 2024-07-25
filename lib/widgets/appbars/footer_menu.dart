import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/feature/theme/di/theme_inherited.dart';
import '/screens/error_screen.dart';

class FooterMenu extends StatelessWidget {
  const FooterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final String currentTheme = isDarkMode ? 'Тёмная' : 'Светлая';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const _DragHandle(),
            _ThemeTile(currentTheme: currentTheme),
            const _UploadPhotoTile(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 4,
        width: 50,
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _ThemeTile extends StatelessWidget {
  final String currentTheme;

  const _ThemeTile({required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      leading: const Icon(Icons.light_mode_outlined, size: 28),
      title: Text(
        'Тема',
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Text(
        currentTheme,
        style: GoogleFonts.roboto(
          fontSize: 20,
        ),
      ),
      onTap: () {
        ThemeInherited.of(context).switchThemeMode();
      },
    );
  }
}

class _UploadPhotoTile extends StatelessWidget {
  const _UploadPhotoTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      leading: const Icon(Icons.cloud_upload_outlined, size: 28),
      title: Text(
        'Загрузить фото',
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ErrorScreen()),
        );
      },
    );
  }
}
