import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CaptureButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const CaptureButtonWidget({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        './assets/icons/camera_tap.svg',
        width: 90,
        height: 90,
      ),
    );

    // return ElevatedButton(
    //   onPressed: onPressed,
    //   style: ElevatedButton.styleFrom(
    //     shape: CircleBorder(),
    //     padding: EdgeInsets.all(20),
    //     backgroundColor: Colors.white
    //   ),
    //   child: 
    //   SizedBox(width: 40, height: 40,),
    // );
  }
}
