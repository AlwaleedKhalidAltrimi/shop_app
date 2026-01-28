import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/gradient_background.dart';
import '../controllers/signup_controller.dart';
import 'widgets/container_under_widgets.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends GetView<SignupController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
              sliver: SliverToBoxAdapter(child: SignUpViewBody()),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ContainerUnderWidgets(
                    promptText: 'Already have an account?',
                    linkText: 'Sign in',
                    onTap: () {
                      Get.offNamed(AppRoutes.login);
                    },
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
