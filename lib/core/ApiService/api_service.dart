import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/constants/app_constants.dart';

class ApiService {
  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}$endpoint'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Request failed with status code ${response.statusCode}");
    }
  }
}
