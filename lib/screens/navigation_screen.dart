import 'package:agro_connect/navigators.dart';
import 'package:agro_connect/screens/ask_screen.dart';
import 'package:agro_connect/screens/landing_screen.dart';
import 'package:agro_connect/screens/saved_content_screen.dart';
import 'package:agro_connect/screens/user_profile_screen.dart';
import 'package:agro_connect/widgets/myAppBar.dart';
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
      appBar: MyAppBar(),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("item1"),
            ),
            ListTile(
              title: Text("item2"),
            ),
          ],
        ),
      ),
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
        key: bottomNavigatorKey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xFF373737),
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
              color: Color(0xFF373737),
            ),
            label: "ask",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmarks_outlined,
              color: Color(0xFF373737),
            ),
            label: "saved",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(
                'lib/assets/user.png',
              ),
            ),
            label: "profile",
          ),
        ],
        unselectedLabelStyle: TextStyle(
          color: Color(0xFF373737),
        ),
        selectedLabelStyle: TextStyle(color: Colors.green),
        selectedIconTheme: IconThemeData(color: Colors.green),
        showSelectedLabels: false,
      ),
    );
  }
}
