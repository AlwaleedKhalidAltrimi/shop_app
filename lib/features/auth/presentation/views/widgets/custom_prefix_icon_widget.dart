import 'package:flutter/material.dart';

class CustomPrefixIcon extends StatelessWidget {
  final String imageName;
  final double size;

  const CustomPrefixIcon({super.key, required this.imageName, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageName, width: size, height: size);
  }
}
