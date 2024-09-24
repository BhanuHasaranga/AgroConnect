import 'package:agro_connect/firebase_services/news_service.dart';
import 'package:agro_connect/widgets/postSomethingField.dart';
import 'package:flutter/material.dart';
import 'package:agro_connect/screens/create_news_screen.dart';
import '../widgets/contentCategories.dart';
import '../widgets/newsCard.dart';
import '../models/news_model.dart'; // Assuming you have a model class for News

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Column(
            children: [
              const PostSomethingField(
                lableText: 'Post a News',
                path: CreateNews(),
              ),
              const ContentCategories(
                category1: 'Latest',
                category2: 'Trending',
                category3: 'All',
              ),
              FutureBuilder<List<News>>(
                future: NewsService.getAllNewses(), // Fetch data from Firebase
                builder:
                    (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Failed to load news'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No news available'));
                  } else {
                    List<News> newsList = snapshot.data!;

                    return ListView.separated(
                      shrinkWrap: true,
                      physics:
                          const ClampingScrollPhysics(), // Enable scrolling for the ListView
                      itemCount: newsList.length, // Dynamically set item count
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 16.0),
                      itemBuilder: (BuildContext context, int index) {
                        News news = newsList[index];
                        print("Fetched news count: ${newsList.length}");
                        return NewsCard(
                          publisherImg:
                              'lib/assets/user.png', // Placeholder for the publisher image
                          publisherName: news.userId,
                          publishedTime:
                              'Just now', // Or format `news.time` for the actual timestamp
                          img: news.imageUrl?.isNotEmpty == true
                              ? news.imageUrl!
                              : 'lib/assets/gardening 1.png', // Use network or fallback to asset
                          headline: news.headline,
                          content: news.newsContent,
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
