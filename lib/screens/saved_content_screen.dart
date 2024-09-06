import 'package:flutter/material.dart';

import '../widgets/contentCategories.dart';
import '../widgets/myAppBar.dart';
import '../widgets/navBar.dart';
import '../widgets/newsCard.dart';

class SavedContentScreen extends StatelessWidget {
  const SavedContentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const ContentCategories(
              category1: 'All',
              category2: 'News',
              category3: 'Questions',
            ),
            SizedBox(
              height: 545,
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
                        return const NewsCard(
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
