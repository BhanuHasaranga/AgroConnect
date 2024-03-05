import 'package:flutter/material.dart';

import '../widgets/contentCategories.dart';
import '../widgets/myAppBar.dart';
import '../widgets/navBar.dart';
import '../widgets/newsCard.dart';
import '../widgets/postSomethingField.dart';

class AskScreen extends StatelessWidget {
  const AskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Padding(
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
      bottomNavigationBar: NavBar(),
    );
  }
}
