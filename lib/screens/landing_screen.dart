import 'package:agro_connect/screens/create_news_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/contentCategories.dart';
import '../widgets/MyAppBar.dart';
import '../widgets/newsCard.dart';
import '../widgets/postSomethingField.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            SizedBox(
              height: 490,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4, // Number of NewsCard widgets
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 16.0,
                      ), // Add space of 16.0 pixels between NewsCard widgets
                      itemBuilder: (BuildContext context, int index) {
                        return NewsCard(
                          publisherImg: 'lib/assets/user.png',
                          publisherName: 'Melissa Jan ',
                          publishedTime: '3 Min ago',
                          img: 'lib/assets/gardening 1.png',
                          headline:
                              'Innovative Hydroponic System Increases Crop Yields by 30%',
                          content:
                              'A groundbreaking hydroponic system utilizing advanced technology and',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
