import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/product_models.dart';
import '../../data/services/all_category_service.dart';
import '../../data/services/all_product_service.dart';
import '../../../../core/functions/get_storage.dart';
import '../../data/services/products_by_category_service.dart';

class ProductController extends GetxController {
  final RxList<ProductModel> productList = <ProductModel>[].obs;
  final RxList<ProductModel> favouritesList = <ProductModel>[].obs;
  final RxList<ProductModel> searchList = <ProductModel>[].obs;
  final RxList<ProductModel> filteredList = <ProductModel>[].obs;
  final RxList<String> categoriesList = <String>[].obs;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  final RxString searchText = ''.obs;
  final TextEditingController searchTextController = TextEditingController();

  final RxString selectedCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();

    loadFavouritesFromStorage();
    fetchAllProducts();
    fetchCategories();
  }

  void fetchAllProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final products = await AllProductService.getAllProducts();
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
  void loadFavouritesFromStorage() {
    List? storedShoppings = GetStorageUtil.read<List>(
      AppConstants.isFavouritesList,
    );

    if (storedShoppings != null) {
      favouritesList.value = storedShoppings
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }
  }

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
      await GetStorageUtil.write(AppConstants.isFavouritesList, favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  // Methods for category filtering
  void fetchCategories() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final categories = await AllCategoryService.getAllCategories();
      categoriesList.assignAll(categories);
    } catch (e) {
      errorMessage.value = "Unable to load categories. Please try again.";
      debugPrint("Fetch categories error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void filterProductsByCategory(String categoryName) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      if (categoryName.isEmpty) {
        // Show all products if no category is selected
        filteredList.assignAll(productList);
      } else {
        // Fetch products for the selected category
        final filteredProducts =
            await ProductsByCategoryService.getProductsByCategory(categoryName);
        filteredList.assignAll(filteredProducts);
      }

      selectedCategory.value = categoryName;
    } catch (e) {
      errorMessage.value =
          "Unable to load products for category. Please try again.";
      debugPrint("Filter products by category error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }
}
