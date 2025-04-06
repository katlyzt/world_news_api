class NewsArticleModel {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticleModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      urlToImage: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
