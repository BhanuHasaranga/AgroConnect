import 'package:flutter/material.dart';

import '../widgets/contentCategories.dart';
import '../widgets/navBar.dart';
import '../widgets/newsCard.dart';
import '../widgets/postSomethingField.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'News Feed',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color(0xFF373737),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 35,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
            iconSize: 35,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            iconSize: 35,
          )
        ],
      ),
      body: const Padding(
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
      bottomNavigationBar: const NavBar(),
    );
  }
}
