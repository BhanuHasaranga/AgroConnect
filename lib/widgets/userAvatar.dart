import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String src;
  const Avatar({
    Key? key,
    required this.size,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        radius: size,
        backgroundImage: AssetImage(
          src,
        ),
      ),
    );
  }
}