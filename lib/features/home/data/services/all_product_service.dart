import '../../../../core/ApiService/api_service.dart';
import '../models/product_models.dart';

class AllProductService {
  static Future<List<ProductModel>> getAllProducts() async {
    final jsonList = await ApiService.get('/products');

    return (jsonList as List)
        .map((jsonItem) => ProductModel.fromJson(jsonItem))
        .toList();
  }
}
