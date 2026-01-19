import '../../features/auth/presentation/views/forgot_password_view.dart';
import '../../features/auth/presentation/views/log_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/welcome/presentation/views/welcome_view.dart';
import '../bindings/initialbinding.dart';
import 'app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final getPages = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LogInView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: InitialBinding(),
    ),
  ];
}
