import 'package:flutter/material.dart';

import '../widgets/contentCategories.dart';
import '../widgets/navBar.dart';
import '../widgets/MyAppBar.dart';
import '../widgets/newsCard.dart';
import '../widgets/postSomethingField.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            PostSomethingField(
              lableText: 'Post a News',
            ),
            ContentCategories(
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
                    NewsCard(),
                    NewsCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
