import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../data/models/product_models.dart';
import '../../data/services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  //search
  var searchList = <ProductModel>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getAllProductss();
  }

  void getAllProductss() async {
    var products = await AllProductsService.getAllProducts();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //Search Bar Logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
