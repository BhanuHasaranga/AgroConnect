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
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Publisher information row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Avatar(
                      size: 20,
                      src: publisherImg, // User avatar
                    ),
                    const SizedBox(width: 8), // Spacing between avatar and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(publisherName),
                            const Icon(
                              Icons.verified_outlined,
                              size: 12,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        Text(
                          publishedTime,
                          style: const TextStyle(fontSize: 11),
                        ),
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
            
            // Image (network or asset)
            img.startsWith('http')
                ? Image.network(
                    img,
                    height: 200, // Adjust as needed
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    img,
                    height: 200, // Adjust as needed
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            
            // Headline and content
            const SizedBox(height: 8),
            Text(
              headline,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: const TextStyle(fontSize: 12),
            ),
            
            // Interactions row
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
            ),
          ],
        ),
      ),
    );
  }
}
