import 'package:get/get.dart';
import '../views/home_view.dart';
import '../../../favorite/presentation/views/favorites_view.dart';
import '../views/settings_view.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    const HomeView(),
    const FavoritesView(),
    const SettingsView(),
  ].obs;

  var title = ["Shop App", "Favorites", "Settings"].obs;
}
