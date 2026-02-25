import '../../../../core/ApiService/api_service.dart';

class AllCategoryService {
  static Future<List<String>> getAllCategories() async {
    final jsonList = await ApiService.get('/products/categories');

    return List<String>.from(jsonList);
  }
}
