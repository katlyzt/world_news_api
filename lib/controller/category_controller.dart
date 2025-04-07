import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_news_api/model/category_model.dart';

class CategoryController with ChangeNotifier {
  bool isLoading = false;
  final apiKey = 'e26501c430474ad9b5edde3121244803';
  final baseUrl = 'https://newsapi.org/v2/';
  List<Source> category = [];

  Future<void> fetchCategory(String selectedCategory) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
      "${baseUrl}sources?category=$selectedCategory&apiKey=$apiKey",
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        category = CategoryModel.fromJson(jsonData).sources;
      } else {
        debugPrint('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching categories: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
