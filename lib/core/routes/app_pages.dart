import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/log_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/views/widgets/home_nav_bar_widget.dart';
import '../../features/welcome/presentation/views/welcome_view.dart';
import '../bindings/app_binding.dart';
import 'app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final getPages = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LogInView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.homeNavBar,
      page: () => const HomeNavBarWidget(),
      binding: AppBinding(),
    ),
  ];
}
