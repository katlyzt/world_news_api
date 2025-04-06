import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news_api/controller/news_controller.dart';
import 'package:world_news_api/view/homescreen_view/homescreen_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsController()),
      ],
      child: const WorldNewsApi(),
    ),
  );
}

class WorldNewsApi extends StatelessWidget {
  const WorldNewsApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomescreenView(),
    );
  }
}
