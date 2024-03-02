import 'package:flutter/material.dart';

class ContentCategories extends StatelessWidget {
  final String category1;
  final String category2;
  final String category3;
  const ContentCategories({
    Key? key,
    required this.category1,
    required this.category2,
    required this.category3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            category1,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            category2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: const ButtonStyle(
            alignment: Alignment.centerRight,
          ),
          child: Text(
            category3,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
