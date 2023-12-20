import 'dart:convert';
import 'package:http/http.dart' as http;

class FakeStoreService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<Map<String, dynamic>>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Map<String, dynamic>> products = List<Map<String, dynamic>>.from(data);
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
