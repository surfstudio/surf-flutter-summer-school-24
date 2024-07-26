import 'package:flutter/material.dart';

final class AdvancedImage {
  final Image image;
  final String id;
  final DateTime? createdAt;

  const AdvancedImage({required this.image, required this.id, this.createdAt});
}
