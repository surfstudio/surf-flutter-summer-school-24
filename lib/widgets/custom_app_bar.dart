import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final int totalImages;

  const CustomAppBar({
    super.key,
    required this.currentIndex,
    required this.totalImages,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        DateFormat('dd.MM.yyyy').format(DateTime.now()),
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
      leading: const Center(
        child: SizedBox(
          width: 60,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: null,
          ),
        ),
      ),
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
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: '/$totalImages',
                    style: GoogleFonts.roboto(
                      color: Colors.black.withOpacity(0.5),
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
