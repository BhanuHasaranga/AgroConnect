// import 'package:agro_connect/screens/login_screen.dart';
// import 'package:agro_connect/screens/start_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
// import 'package:agro_connect/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _agroController;
  late AnimationController _connectController;
  late AnimationController _fullStopController;

  @override
  void initState() {
    super.initState();

    _agroController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _connectController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _fullStopController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _startAnimation();
  }

  _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));

    _agroController.forward();
    await Future.delayed(Duration(milliseconds: 500));

    _connectController.forward();
    await Future.delayed(Duration(milliseconds: 500));

    _fullStopController.forward();
    await Future.delayed(Duration(milliseconds: 1000));

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => StartScreen(),
    //   ),
    // );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  void dispose() {
    _agroController.dispose();
    _connectController.dispose();
    _fullStopController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _agroController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _agroController.value,
                  child: Text(
                    'Agro',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 8),
            AnimatedBuilder(
              animation: _connectController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width *
                              _connectController.value,
                      0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Connect',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
