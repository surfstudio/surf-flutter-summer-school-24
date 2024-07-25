import 'package:flutter/material.dart';

class CaptureButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const CaptureButtonWidget({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.white
      ),
      child: 
      SizedBox(width: 40, height: 40,),
    );
  }
}
