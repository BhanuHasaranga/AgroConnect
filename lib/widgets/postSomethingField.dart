import 'package:agro_connect/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'userAvatar.dart';

class PostSomethingField extends StatelessWidget {
  final String lableText;
  final Widget path;
  const PostSomethingField({
    Key? key,
    required this.lableText,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Avatar(
            size: 15,
            src: 'lib/assets/user.png',
            
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfileScreen()),
            );
          },
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 35,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => path),
                );
              },
              style: ButtonStyle(
                alignment: Alignment.centerLeft,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  lableText,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.image_outlined),
          iconSize: 35,
        )
      ],
    );
  }
}
