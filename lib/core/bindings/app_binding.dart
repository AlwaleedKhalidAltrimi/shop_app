import 'package:get/get.dart';
import '../../features/auth/presentation/controllers/login_controller.dart';
import '../../features/auth/presentation/controllers/signup_controller.dart';
import '../../features/auth/presentation/controllers/forgot_password_controller.dart';
import '../../features/home/presentation/controllers/product_controller.dart';
import '../../features/welcome/presentation/controllers/welcome_controller.dart';
import '../../features/home/presentation/controllers/main_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ForgotPasswordController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => ProductController());
  }
}
