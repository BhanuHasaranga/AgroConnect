import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Color(0xFF373737),
            fontSize: 25,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/assets/user.png',
                ),
                radius: 35,
              ),
              title: Text(
                "notification",
              ),
              subtitle: Text(
                  "this is a hard coded notification for testing purposes"),
              tileColor: Colors.green.shade50,
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 2,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/assets/user.png',
                ),
                radius: 35,
              ),
              title: Text(
                "notification",
              ),
              subtitle: Text(
                  "this is a hard coded notification for testing purposes"),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 2,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/assets/user.png',
                ),
                radius: 35,
              ),
              title: Text(
                "notification",
              ),
              subtitle: Text(
                  "this is a hard coded notification for testing purposes"),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 2,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/assets/user.png',
                ),
                radius: 35,
              ),
              title: Text(
                "notification",
              ),
              subtitle: Text(
                  "this is a hard coded notification for testing purposes"),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 2,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/assets/user.png',
                ),
                radius: 35,
              ),
              title: Text(
                "notification",
              ),
              subtitle: Text(
                  "this is a hard coded notification for testing purposes"),
              tileColor: Colors.green.shade50,
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 2,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'lib/assets/user.png',
                ),
                radius: 35,
              ),
              title: Text(
                "notification",
              ),
              subtitle: Text(
                  "this is a hard coded notification for testing purposes"),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
