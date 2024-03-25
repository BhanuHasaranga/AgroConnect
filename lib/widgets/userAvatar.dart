import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String? src;
  const Avatar({
    Key? key,
    required this.size,
    this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (src != null) {
      return IconButton(
        onPressed: () {},
        icon: CircleAvatar(
          radius: size,
          backgroundImage: AssetImage(
            src!,
          ),
        ),
      );
    } else {
      // Return an icon or any other widget you want to display
      return CircleAvatar(
        radius: size,
        backgroundColor: Colors.grey.shade300,
        child: IconButton(
          onPressed: () {},
          iconSize: (size),
          icon: Icon(
            Icons.person,
            color: Colors.grey.shade800,
          ), // Change this to the desired icon
        ),
      );
    }
  }
}
