import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news_api/model/news_article_model.dart';

class ArticledetailsScreenView extends StatelessWidget {
  const ArticledetailsScreenView({super.key, required this.newsArticleModel});
  final NewsArticleModel newsArticleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Consumer(
          builder:
              (context, value, child) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.network(newsArticleModel.urlToImage),
                    Text(
                      newsArticleModel.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      newsArticleModel.description,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
