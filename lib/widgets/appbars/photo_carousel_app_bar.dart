import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final int totalImages;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.currentIndex,
    required this.totalImages,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color accent = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;


    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        DateFormat('dd.MM.yyyy').format(DateTime.now()),
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w300,
        ),
      ),
      leading: onBackPressed != null
          ? Center(
              child: SizedBox(
                width: 60,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBackPressed,
                ),
              ),
            )
          : null,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${currentIndex + 1}',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      color: accent,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: '/$totalImages',
                    style: GoogleFonts.roboto(
                      color: accent.withOpacity(0.5),
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
