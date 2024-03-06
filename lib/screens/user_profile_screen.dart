import 'package:flutter/material.dart';

import '../widgets/myAppBar.dart';
import '../widgets/navBar.dart';
import '../widgets/newsCard.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'lib/assets/user.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jane Miles',
                          style: TextStyle(
                            color: Color(0xFF373737),
                            fontSize: 19,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                            letterSpacing: 0.19,
                          ),
                        ),
                        const Text(
                          'Urban Farmer',
                          style: TextStyle(
                            color: Color(0xBF373737),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.12,
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(
                                color: Color(0xFF4E7D4C),
                                width: 1.0,
                              ),
                            )),
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                          ),
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Color(0xFF4E7D4C),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                'Urban Farmer Extraordinaire! 🌱 Passionate about sustainable agriculture in urban environments. Growing fresh, organic veggies, herbs, and microgreens in small spaces.',
              ),
              const Text(
                'Basic Info',
                style: TextStyle(
                  color: Color(0xFF373737),
                  fontSize: 19,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.19,
                ),
              ),
              const Row(
                children: [
                  Text(
                    'Occupation: ',
                  ),
                  Text(
                    'Urban Farmer, Sustainability Advocate',
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Lives in: ',
                  ),
                  Text(
                    'Brooklyn, New York',
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Date of birth: ',
                  ),
                  Text(
                    '12 th of August 1987',
                  ),
                ],
              ),
              const Text(
                'Interests',
                style: TextStyle(
                  color: Color(0xFF373737),
                  fontSize: 19,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.19,
                ),
              ),
              Row(
                children: [
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF4E7D4C),
                    ),
                    child: const Text(
                      'Urban Gardening',
                    ),
                  ),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF4E7D4C),
                    ),
                    child: const Text(
                      'Urban Gardening',
                    ),
                  ),
                ],
              ),
              const Text(
                'News/Questions',
                style: TextStyle(
                  color: Color(0xFF373737),
                  fontSize: 19,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: 0.19,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4, // Number of NewsCard widgets
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 16.0,
                ), // Add space of 16.0 pixels between NewsCard widgets
                itemBuilder: (BuildContext context, int index) {
                  return const NewsCard();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
