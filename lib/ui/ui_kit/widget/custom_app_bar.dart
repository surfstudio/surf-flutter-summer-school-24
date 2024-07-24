import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_summer_school_24/ui/ui_kit/widget/custom_bottom_sheet.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.preferredSize = const Size.fromHeight(80),
  });

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        'assets/logo.svg',
        color: Colors.black,
        height: 34,
        width: 140,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return const CustomBottomSheet();
              },
            );
          },
          child: SvgPicture.asset(
            'assets/icon_app_bar.svg',
          ),
        ),
      ],
    );
  }
}
