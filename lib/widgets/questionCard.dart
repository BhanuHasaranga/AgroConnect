import 'package:flutter/material.dart';

class newsCard extends StatelessWidget {
  const newsCard({
    super.key,
  });

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
                    IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        // radius: 30,
                        backgroundImage: AssetImage(
                          'lib/assets/user.png',
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Melissa Jane ',
                            ),
                            Icon(
                              Icons.verified_outlined,
                              size: 12,
                              color: Colors.green,
                            )
                          ],
                        ),
                        Text(
                          '3 Min ago',
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
              'lib/assets/gardening 1.png',
            ),
            const Text(
              'Innovative Hydroponic System Increases Crop Yields by 30%',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const Text(
              'A groundbreaking hydroponic system utilizing advanced technology and',
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