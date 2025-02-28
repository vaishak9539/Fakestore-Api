// lib/services/api_service.dart
import 'dart:convert';

import 'package:fakestoreapi/constant/constant.dart';
import 'package:fakestoreapi/provider_service/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<Product>> fetchProducts() async {
    try {
      var url = Uri.parse(productUrl);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print(data);
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      final response =
          // await http.get(Uri.parse('$baseUrl/products/categories'));
          await http.get(Uri.parse(categoriesUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((category) => category.toString()).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
