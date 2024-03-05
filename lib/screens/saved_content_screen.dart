import 'package:flutter/material.dart';

import '../widgets/contentCategories.dart';
import '../widgets/myAppBar.dart';
import '../widgets/navBar.dart';
import '../widgets/newsCard.dart';

class SavedContentScreen extends StatelessWidget {
  const SavedContentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            ContentCategories(
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
