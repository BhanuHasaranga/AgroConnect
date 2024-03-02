import 'package:agro_connect/screens/ask_screen.dart';
import 'package:agro_connect/screens/landing_screen.dart';
import 'package:agro_connect/screens/saved_content_screen.dart';
import 'package:agro_connect/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LandingScreen()),
            );
          },
          icon: const Icon(Icons.home_outlined),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AskScreen()),
            );
          },
          icon: const Icon(Icons.chat_outlined),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SavedContentScreen()),
            );
          },
          icon: const Icon(Icons.bookmarks_outlined),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserProfileScreen()),
            );
          },
          icon: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(
              'lib/assets/user.png',
            ),
          ),
        ),
      ],
    );
  }
}
