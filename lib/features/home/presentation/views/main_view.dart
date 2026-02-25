import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(AppImages.imagesShop),
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs,
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
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
