import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_models.dart';
import '../../../../core/constants/app_constants.dart';

class AllProductsService {
  static Future<List<ProductModel>> getAllProducts() async {
    http.Response response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/products'),
    );

    if (response.statusCode == 200) {
      var jsonData = response.body;
      List<dynamic> jsonList = json.decode(jsonData);
      return jsonList
          .map((jsonItem) => ProductModel.fromJson(jsonItem))
          .toList();
    } else {
      return throw Exception(
        "Failed to load product with status code ${response.statusCode}",
      );
    }
  }
}
