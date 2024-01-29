import 'package:agro_connect/screens/choose_path_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'lib/assets/full-shot-smiley-women-with-hats 1.png',
        fit: BoxFit.cover,
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height) / 3,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Image.asset(
                'lib/assets/logo.png',
                width: (MediaQuery.of(context).size.width) / 2,
              ),
              const Text(
                'Welcome to AgroConnect, where farming knowledge grows together! Connect, share, and thrive with fellow farmers in your community. ',
                textAlign: TextAlign.center,
              ),
              SearchBar(
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side:
                        const BorderSide(color: Color(0xFF4E7D4C), width: 2.0),
                  ),
                ),
                hintText: 'Search Something', 
                leading: const Icon(
                  Icons.search,
                  color: Color(0xFF4E7D4C),
                ),
                elevation: MaterialStateProperty.all<double>(0.0),
              ),
              const Text('Or'),
              SizedBox(
                width: 400,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoosePathScreen()),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF4E7D4C)),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.19,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
