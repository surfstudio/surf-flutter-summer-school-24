import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SwitchButtonWidget extends StatelessWidget {
  const SwitchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        './assets/icons/camera_switch.svg',
        width: 32,
        height: 32,
      ),
    );
  }
}