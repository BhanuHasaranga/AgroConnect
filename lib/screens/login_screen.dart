import 'package:agro_connect/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:agro_connect/screens/landing_screen.dart';

class Login extends StatefulWidget {
  // final VoidCallback show;
  // const Login({super.key});
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  FocusNode email_F = FocusNode();
  final password = TextEditingController();
  FocusNode password_F = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 120),
              Center(
                child: Image.asset(
                  'lib/assets/logo.png',
                  scale: 3,
                ),
              ),
              const SizedBox(height: 120),
              CustomTextField(
                email,
                Icons.email,
                'Email',
                email_F,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                password,
                Icons.lock,
                'Password',
                password_F,
              ),
              const SizedBox(
                height: 10,
              ),
              ForgotPassword(),
              const SizedBox(
                height: 10,
              ),
              SubmitButton(context, 'Log In'),
              const SizedBox(
                height: 10,
              ),
              LoginOrSignup("Don't you have account?", "Sign up")
            ],
          ),
        ),
      ),
    );
  }

  Widget LoginOrSignup(String hintText, String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hintText,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              option,
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

  Widget SubmitButton(BuildContext context, String type) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF4E7D4C),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4E7D4C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Navigation()),
          );
        },
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

  Widget ForgotPassword() {
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

  Widget CustomTextField(
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
