import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/gradient_background.dart';
import '../controllers/login_controller.dart';
import 'widgets/container_under_widgets.dart';
import 'widgets/log_in_view_body.dart';

class LogInView extends GetView<LoginController> {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
              sliver: SliverToBoxAdapter(child: LogInViewBody()),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ContainerUnderWidgets(
                    promptText: 'Don\'t have an account?',
                    linkText: 'Sign up',
                    onTap: () {
                      Get.offNamed(AppRoutes.signUp);
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
