import 'dart:io';

import 'package:agro_connect/firebase_services/firebase_auth.dart'; // Assuming this is your Firebase authentication service
import 'package:agro_connect/screens/login_screen.dart';
import 'package:agro_connect/screens/start_screen.dart';
import 'package:agro_connect/util/excption.dart';
import 'package:agro_connect/widgets/userAvatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Authentication _auth =
      Authentication(); // Use your correct Authentication class

  final TextEditingController username = TextEditingController();
  final FocusNode usernameF = FocusNode();
  final TextEditingController email = TextEditingController();
  final FocusNode emailF = FocusNode();
  final TextEditingController password = TextEditingController();
  final FocusNode passwordF = FocusNode();
  final TextEditingController passwordConfirm = TextEditingController();
  final FocusNode passwordConfirmF = FocusNode();

  File? profilePic;

  // Function to pick a profile picture from gallery
  Future<void> pickProfilePicture() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePic = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              GestureDetector(
                onTap: pickProfilePicture,
                child: Avatar(
                  size: 35,
                  image: profilePic != null
                      ? FileImage(
                          profilePic!) // Display selected profile picture
                      : null,
                ),
              ),
              const SizedBox(height: 35),
              customTextField(
                username,
                Icons.person,
                'Username',
                usernameF,
              ),
              const SizedBox(height: 10),
              customTextField(
                email,
                Icons.email,
                'Email',
                emailF,
              ),
              const SizedBox(height: 15),
              customTextField(
                password,
                Icons.lock,
                'Password',
                passwordF,
              ),
              const SizedBox(height: 10),
              customTextField(
                passwordConfirm,
                Icons.lock,
                'Confirm Password',
                passwordConfirmF,
              ),
              const SizedBox(height: 20),
              submitButton('Sign Up'),
              const SizedBox(height: 10),
              toSignup(),
            ],
          ),
        ),
      ),
    );
  }

  // Navigation to Login screen
  Widget toSignup() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Already have an account?",
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

  // Dialog for error messages
  void dialogBuilder(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );
  }

  // Submit button to trigger sign-up
  Widget submitButton(String type) {
    return InkWell(
      onTap: () async {
        try {
          // Call signUp method from Authentication class
          await _auth.signUp(
            username: username.text,
            email: email.text,
            password: password.text,
            passwordConfirm: passwordConfirm.text,
            profilePic: profilePic ?? null, // Pass profilePic or null
          );

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Sign Up successful!"),
              backgroundColor: Colors.green,
            ),
          );

          // Navigate to ChoosePathScreen after success
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const StartScreen()),
          );
        } on exceptions catch (e) {
          // Show error message in dialog if sign up fails
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

  // Custom text field for input
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
          ),
        ),
      ),
    );
  }
}
