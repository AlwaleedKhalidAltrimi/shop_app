import 'package:flutter/material.dart';
import 'custom_forgot_password_form.dart';
import 'forgot_password_image.dart';
import 'forgot_password_title.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const ForgotPasswordTitle(),
        const SizedBox(height: 50),
        const ForgotPasswordImage(),
        const SizedBox(height: 50),
        const CustomForgotPasswrodForm(),
      ],
    );
  }
}
