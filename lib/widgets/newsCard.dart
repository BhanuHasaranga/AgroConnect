import 'package:agro_connect/widgets/userAvatar.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {

  final String publisherImg;
  final String publisherName;
  final String publishedTime;
  final String img;
  final String headline;
  final String content;

  const NewsCard({
    
    Key? key,
    required this.publisherImg,
    required this.publisherName,
    required this.publishedTime,
    required this.img,
    required this.headline,
    required this.content,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Row(
                  children: [
                    Avatar(
                      size: 20,
                      src: publisherImg,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              publisherName,
                            ),
                            Icon(
                              Icons.verified_outlined,
                              size: 12,
                              color: Colors.green,
                            )
                          ],
                        ),
                        Text(
                          publishedTime,
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_outline),
                ),
              ],
            ),
            Image.asset(
              img,
            ),
             Text(
              headline,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
             Text(
              content,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_alt_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_down_alt_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
