import 'package:get/get.dart';
import '../views/home_view.dart';
import '../views/category_view.dart';
import '../../../favorite/presentation/views/favorites_view.dart';
import '../views/settings_view.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    const HomeView(),
    const CategoryView(),
    const FavoritesView(),
    const SettingsView(),
  ].obs;

  var title = ["SHOP App", "Categories", "Favorites", "Settings"].obs;
}
