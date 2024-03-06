import 'package:flutter/material.dart';

class CommunityCircle extends StatelessWidget {
  const CommunityCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(
            'lib/assets/user.png',
          ),
        ),
        Text(
          'Cattle Clan',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}