import 'dart:io';

import 'package:agro_connect/firebase_services/firebase_auth.dart';
import 'package:agro_connect/screens/login_screen.dart';
// import 'package:agro_connect/util/dialog.dart';
import 'package:agro_connect/util/excption.dart';
import 'package:agro_connect/widgets/userAvatar.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  // final VoidCallback show;
  // const SignUp({super.key});
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final username = TextEditingController();
  FocusNode usernameF = FocusNode();
  final email = TextEditingController();
  FocusNode emailF = FocusNode();
  final password = TextEditingController();
  FocusNode passwordF = FocusNode();
  final passwordConfirm = TextEditingController();
  FocusNode passwordConfirmF = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Center(
                child: Image.asset(
                  'lib/assets/logo.png',
                  scale: 3,
                ),
              ),
              const SizedBox(height: 35),
              const Avatar(size: 35),
              const SizedBox(height: 35),
              customTextField(
                username,
                Icons.person,
                'Username',
                usernameF,
              ),
              const SizedBox(
                height: 10,
              ),
              customTextField(
                email,
                Icons.email,
                'Email',
                emailF,
              ),
              const SizedBox(
                height: 15,
              ),
              customTextField(
                password,
                Icons.lock,
                'Password',
                passwordF,
              ),
              const SizedBox(
                height: 10,
              ),
              customTextField(
                passwordConfirm,
                Icons.lock,
                'Confirm Password',
                passwordConfirmF,
              ),
              const SizedBox(
                height: 20,
              ),
              submitButton('Sign Up'),
              const SizedBox(
                height: 10,
              ),
              toSignup()
            ],
          ),
        ),
      ),
    );
  }

  Widget toSignup() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Do you have account?",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Text(
              "Log In",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF4E7D4C),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dialogBuilder(BuildContext context, String message) {
    // Use the provided context to show the dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        // ... other dialog options
      ),
    );
  }

  Widget submitButton(String type) {
    return InkWell(
      onTap: () async {
        try {
          await Authentication().signUp(
              username: username.text,
              email: email.text,
              password: password.text,
              passwordConfirm: passwordConfirm.text,
              profilePic: File(''));
        } on exceptions catch (e) {
          // ignore: use_build_context_synchronously
          dialogBuilder(context, e.message);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF4E7D4C),
        ),
        child: Text(
          type,
          style: const TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'forgot your password?',
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFF4E7D4C),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget customTextField(
    TextEditingController controller,
    IconData icon,
    String type,
    FocusNode focusNode,
  ) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: TextField(
        style: const TextStyle(fontSize: 18, color: Colors.black),
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: type,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? const Color(0xFF4E7D4C) : Colors.grey,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xFF4E7D4C),
                width: 2,
              ),
            )),
      ),
    );
  }
}
