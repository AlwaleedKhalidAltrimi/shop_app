import '../../../../core/ApiService/api_service.dart';
import '../models/product_models.dart';

class ProductsByCategoryService {
  static Future<List<ProductModel>> getProductsByCategory(
    String categoryName,
  ) async {
    final jsonList = await ApiService.get('/products/category/$categoryName');

    return (jsonList as List)
        .map((jsonItem) => ProductModel.fromJson(jsonItem))
        .toList();
  }
}
