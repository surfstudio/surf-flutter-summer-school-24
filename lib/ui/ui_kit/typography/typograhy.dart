import 'package:flutter/material.dart';

abstract class AppTypography {
  static const TextStyle normal18 = TextStyle(
    fontSize: 18,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bold28 = TextStyle(
    fontSize: 28,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bold18 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}
