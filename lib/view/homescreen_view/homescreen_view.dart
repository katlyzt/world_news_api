import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:world_news_api/controller/news_controller.dart';
import 'package:world_news_api/view/articledetails_screen_view/articledetails_screen_view.dart';

class HomescreenView extends StatefulWidget {
  const HomescreenView({super.key});

  @override
  State<HomescreenView> createState() => _HomescreenViewState();
}

class _HomescreenViewState extends State<HomescreenView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<NewsController>().fetchTopHeadlines());
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<NewsController>();
    // final method = context.read<NewsController>();
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: Consumer(
        builder: (context, value, child) {
          return ListView(
            children: [
              // Category section

              // Breaking News - Carousel
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                ),
                items:
                    data.news.map((article) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  article.urlToImage ??
                                      'https://via.placeholder.com/150',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.all(12),
                              color: Colors.black.withValues(
                                alpha: 0.5,
                              ), // dark overlay for text
                              child: Text(
                                article.title ?? "No Title",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),

              const SizedBox(height: 10),

              // News List
              ...List.generate(data.news.length, (index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            data.news[index].urlToImage,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // News Info
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                ArticledetailsScreenView(
                                                  newsArticleModel:
                                                      data.news[index],
                                                ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    data.news[index].title ?? "No Title",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  data.news[index].description ?? "No Title",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
