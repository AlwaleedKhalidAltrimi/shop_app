import 'package:flutter/material.dart';
import 'custom_auth_text.dart';
import 'custom_signup_form.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        CustomAuthText(promptText: 'SIGN', linkText: 'UP'),
        const SizedBox(height: 60),
        const CustomSignUpForm(),
      ],
    );
  }
}
