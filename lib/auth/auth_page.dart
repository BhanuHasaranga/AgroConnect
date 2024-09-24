import 'package:agro_connect/firebase_services/user_service.dart';
import 'package:agro_connect/screens/email_verification_screen.dart';
import 'package:agro_connect/screens/login_screen.dart';
import 'package:agro_connect/screens/navigation_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  _navigate() {
    if (UserService.isSignedIn) {
      final emailVerified = UserService.isVerified();
      if (emailVerified) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Navigation(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const EmailVerification(),
          ),
        );
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  _waitAndNavigate() async {
    await Future.delayed(const Duration(seconds: 2));
    _navigate();
  }

  @override
  void initState() {
    _waitAndNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
