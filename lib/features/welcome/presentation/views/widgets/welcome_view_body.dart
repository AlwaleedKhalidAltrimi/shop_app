import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:get/get.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/gradient_background.dart';
import '../../controllers/welcome_controller.dart';
import 'fade_scale_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_have_an_account.dart';

class WelcomeViewBody extends GetView<WelcomeController> {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: FadeScaleTransition(
                  animation: controller.fadeScaleAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 120),

                      const FadeScaleText(),

                      const Spacer(),

                      Icon(
                        Icons.shopping_cart,
                        size: 120,
                        color: Colors.white.withValues(alpha: 0.9),
                        shadows: [
                          Shadow(
                            offset: const Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black.withValues(alpha: 0.2),
                          ),
                        ],
                      ),

                      const Spacer(),

                      CustomButton(
                        text: 'Get Started',
                        onPressed: () {
                          Get.offNamed(AppRoutes.login);
                        },
                      ),

                      const SizedBox(height: 12),

                      CustomHaveAnAccount(
                        promptText: "Don't have an account?",
                        linkText: 'Sign up',
                        onTap: () {
                          Get.offNamed(AppRoutes.signUp);
                        },
                      ),

                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
