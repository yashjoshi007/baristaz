import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class DrinkRepository {
  final String baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=';
  Future<List<DrinkModel>> fetchDrinks(String searchTerm) async {
    final response = await http.get(Uri.parse('$baseUrl$searchTerm'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> drinksData = data['drinks'];
      return drinksData.map((drink) => DrinkModel.fromJson(drink)).toList();
    } else {
      throw Exception('Failed to load drinks');
    }
  }
}
