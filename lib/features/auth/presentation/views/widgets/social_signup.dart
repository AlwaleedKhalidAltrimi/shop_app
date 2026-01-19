import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';
import 'social_icon_widgets.dart';

class SocialSignup extends StatelessWidget {
  final VoidCallback? onFacebookTap;
  final VoidCallback? onGoogleTap;

  const SocialSignup({super.key, this.onFacebookTap, this.onGoogleTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          image: AppImages.imagesFacebook,
          width: size.width * 0.14,
          onTap: onFacebookTap,
        ),
        const SizedBox(width: 14),
        SocialIcon(
          image: AppImages.imagesGoogle,
          width: size.width * 0.14,
          onTap: onGoogleTap,
        ),
      ],
    );
  }
}
