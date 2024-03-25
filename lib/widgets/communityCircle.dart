import 'package:flutter/material.dart';

class CommunityCircle extends StatelessWidget {
  final double size;
  final String src;
  final String communityName;
  const CommunityCircle({
    Key? key,
    required this.size,
    required this.src,
    required this.communityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CircleAvatar(
          radius: size,
          backgroundImage: AssetImage(
            src,
          ),
        ),
        Text(
          communityName,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
