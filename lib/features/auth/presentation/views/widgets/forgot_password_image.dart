import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.7,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(AppImages.imagesForgetPassword, fit: BoxFit.contain),
      ),
    );
  }
}
