import 'package:flutter/material.dart';
import 'custom_auth_text.dart';
import 'custom_login_form.dart';
import 'divider_with_or.dart';
import 'social_signup.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 120),
        const CustomAuthText(promptText: 'LOG', linkText: 'IN'),
        const SizedBox(height: 60),
        const CustomLoginForm(),
        const SizedBox(height: 30),
        const DividerWithOr(),
        const SizedBox(height: 25),
        SocialSignup(
          //  onFacebookTap: controller.faceBookSignUpApp,
          // onGoogleTap: controller.googleSinUpApp,
        ),
      ],
    );
  }
}
