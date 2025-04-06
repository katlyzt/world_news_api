import 'package:world_news_api/model/news_article_model.dart';

class NewsResponse {
  final List<NewsArticleModel> articles;

  NewsResponse({required this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    final articlesJson = json['articles'] as List;
    final articles =
        articlesJson
            .map((articleJson) => NewsArticleModel.fromJson(articleJson))
            .toList();

    return NewsResponse(articles: articles);
  }
}
