import 'package:agro_connect/screens/ask_screen.dart';
import 'package:agro_connect/screens/landing_screen.dart';
import 'package:agro_connect/screens/saved_content_screen.dart';
import 'package:agro_connect/screens/user_profile_screen.dart';
import 'package:agro_connect/widgets/navBar.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            LandingScreen(),
            AskScreen(),
            SavedContentScreen(),
            UserProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined),
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                  'lib/assets/user.png',
                ),
              ),
            ),
          ],
        ));
  }
}
