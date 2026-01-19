import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String image;
  final double width;
  final VoidCallback? onTap;

  const SocialIcon({
    super.key,
    required this.image,
    required this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
