import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_news_api/model/news_article_model.dart';

class NewsController extends ChangeNotifier {
  bool isLoading = false;
  List<NewsArticleModel> news = [];

  final apiKey = 'e26501c430474ad9b5edde3121244803';
  final baseUrl = 'https://newsapi.org/v2/';

  Future<void> fetchTopHeadlines() async {
    final url = Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey');
    isLoading = true;
    notifyListeners(); // Notify before starting fetch

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> articlesJson = jsonData['articles'];

        news =
            articlesJson
                .map((json) => NewsArticleModel.fromJson(json))
                .toList();
      } else {
        debugPrint('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching news: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
