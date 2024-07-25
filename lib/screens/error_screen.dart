import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '😪',
              style: GoogleFonts.roboto(fontSize: 60, fontWeight: FontWeight.w600),
            ),
            Text(
              'Упс!',
              style: GoogleFonts.roboto(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Что-то пошло не так',
              style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),

                backgroundColor: Theme.of(context).colorScheme.surface
              ),
              child: Text(
                'Попробовать снова',
                style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
