import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import 'widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.white, body: WelcomeViewBody());
  }
}
