import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/product_models.dart';
import '../../data/services/product_services.dart';
import '../../../../core/functions/get_storage.dart';

class ProductController extends GetxController {
  final RxList<ProductModel> productList = <ProductModel>[].obs;
  final RxList<ProductModel> favouritesList = <ProductModel>[].obs;
  final RxList<ProductModel> searchList = <ProductModel>[].obs;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  final RxString searchText = ''.obs;
  final TextEditingController searchTextController = TextEditingController();

  // var storage = GetStorageUtil();
  @override
  void onInit() {
    super.onInit();

    List? storedShoppings = GetStorageUtil.read<List>(
      AppConstants.isFavouritesList,
    );

    if (storedShoppings != null) {
      favouritesList.value = storedShoppings
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final products = await AllProductsService.getAllProducts();
      productList.addAll(products);
    } catch (e) {
      errorMessage.value = "Unable to load products. Please try again.";
      debugPrint("Fetch products error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  //Search Bar Logic
  void searchProduct(String value) {
    searchText.value = value;
    final text = value.trim().toLowerCase();
    searchList.value = productList
        .where(
          (product) =>
              product.title.toLowerCase().contains(text) ||
              product.price.toString().contains(text),
        )
        .toList();
  }

  void clearSearchField() {
    searchTextController.clear();
    searchProduct("");
  }

  // Logic for Favourites Screen
  void toggleFavourites(int productId) async {
    var existingIndex = favouritesList.indexWhere(
      (element) => element.id == productId,
    );

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await GetStorageUtil.remove(AppConstants.isFavouritesList);
    } else {
      favouritesList.add(
        productList.firstWhere((element) => element.id == productId),
      );

      // await GetStorageUtil.write(AppConstants.isFavouritesList, favouritesList);
    }
    await GetStorageUtil.write(
      AppConstants.isFavouritesList,
      favouritesList.map((e) => e.toJson()).toList(),
    );
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }
}
