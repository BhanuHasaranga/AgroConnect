import 'package:flutter/material.dart';

import '../widgets/contentCategories.dart';
import '../widgets/navBar.dart';
import '../widgets/newsCard.dart';
import '../widgets/postSomethingField.dart';

class AskScreen extends StatelessWidget {
  const AskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Ask',
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
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'lib/assets/user.png',
                      ),
                    ),
                    Text(
                      'Cattle Clan',
                    )
                  ],
                )
              ],
            ),
            PostSomethingField(
              lableText: 'Post a News',
            ),
            ContentCategories(
              category1: 'Top',
              category2: 'New',
              category3: 'All',
            ),
            SizedBox(
              height: 390,
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
