import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../controllers/home_nav_bar_controller.dart';

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeNavBarController());

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs,
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.black,
          selectedLabelStyle: AppStyles.font14extraBoldPoppins,
          unselectedLabelStyle: AppStyles.font12mediumPoppins,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.category),
              icon: Icon(Icons.category_outlined),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
      );
    });
  }
}
