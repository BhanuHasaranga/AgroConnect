import 'package:flutter/material.dart';

import '../widgets/communityCircle.dart';
import '../widgets/contentCategories.dart';
import '../widgets/myAppBar.dart';
import '../widgets/navBar.dart';
import '../widgets/newsCard.dart';
import '../widgets/postSomethingField.dart';

class AskScreen extends StatelessWidget {
  const AskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommunityCircle(),
                CommunityCircle(),
                CommunityCircle(),
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: ShapeDecoration(
                        color: Color(0x23373737),
                        shape: OvalBorder(),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10.0),
            const PostSomethingField(
              lableText: 'Ask a Question',
            ),
            const ContentCategories(
              category1: 'Top',
              category2: 'New',
              category3: 'All',
            ),
            SizedBox(
              height: 380,
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
                        return const NewsCard();
                      },
                    ),
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
