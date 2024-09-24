import 'dart:io';
import 'package:agro_connect/auth/auth_page.dart';
import 'package:agro_connect/firebase_services/user_service.dart';
import 'package:agro_connect/screens/login_screen.dart';
import 'package:agro_connect/widgets/userAvatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirm = TextEditingController();

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

  // Validation logic
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.text != passwordConfirm.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Sign Up logic
  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() == true) {
      try {
        // Call userRegister method from UserService
        await UserService.userRegister(
          username.text,
          email.text,
          null, // No phone for now
          null, // No occupations in this example
          null, // No main occupation index
          profilePic != null ? profilePic!.path : null, // Profile picture path
          null, // No bio for now
          null, // No city for now
          null, // No state for now
          null, // No country for now
          null, // No date of birth for now
          password.text,
        );

        // Navigate to the StartScreen after successful registration
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sign Up successful!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthPage()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign Up failed: ${e.toString()}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
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
                    image: profilePic != null ? FileImage(profilePic!) : null,
                  ),
                ),
                const SizedBox(height: 35),
                customTextField(
                  controller: username,
                  icon: Icons.person,
                  label: 'Username',
                ),
                const SizedBox(height: 10),
                customTextField(
                  controller: email,
                  icon: Icons.email,
                  label: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                customTextField(
                  controller: password,
                  icon: Icons.lock,
                  label: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                customTextField(
                  controller: passwordConfirm,
                  icon: Icons.lock,
                  label: 'Confirm Password',
                  isPassword: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 20),
                submitButton('Sign Up'),
                const SizedBox(height: 10),
                toLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom TextField Widget
  Widget customTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    TextInputType inputType = TextInputType.text,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '$label cannot be empty';
            }
            return null;
          },
    );
  }

  // Sign Up Button Widget
  Widget submitButton(String type) {
    return InkWell(
      onTap: _signUp,
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

  // Navigation to Login screen
  Widget toLogin() {
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
}
