import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/features/features.dart';
import 'package:surf_flutter_summer_school_24/uikit/uikit.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({
    super.key,
  });

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      onPressed: () {
        setState(() {
          ThemeInherited.of(context).switchThemeMode();
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset('./assets/icons/sun.svg'),
                const SizedBox(width: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Тема',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(),
                ValueListenableBuilder<ThemeMode>(
                  valueListenable: ThemeInherited.of(context).themeMode,
                  builder: (context, themeMode, _) {
                    return Text(
                      themeMode == ThemeMode.dark ? 'Тёмная' : 'Светлая',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
