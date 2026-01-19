import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/gradient_background.dart';
import 'widgets/forgot_password_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: kToolbarHeight,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: AppColors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 48),
                  ],
                ),
              ),
            ),

            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    sliver: SliverToBoxAdapter(child: ForgotPasswordBody()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
