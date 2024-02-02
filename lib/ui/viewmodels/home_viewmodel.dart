import 'package:flutter/material.dart';

import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final DrinkRepository _repository = DrinkRepository();
  List<DrinkModel> _drinks = [];

  List<DrinkModel> get drinks => _drinks;

  Future<void> fetchDrinks({required String searchTerm}) async {
    try {
      final List<DrinkModel> drinks = await _repository.fetchDrinks(searchTerm);
      _drinks = drinks;
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error fetching drinks: $e');
    }
  }
}
