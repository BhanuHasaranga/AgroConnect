import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final VoidCallback show;
  const Login(this.show, {super.key});

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
              SizedBox(height: 120),
              Center(
                child: Image.asset(
                  'lib/assets/logo.png',
                  scale: 3,
                ),
              ),
              SizedBox(height: 120),
              CustomTextField(
                email,
                Icons.email,
                'Email',
                email_F,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                password,
                Icons.lock,
                'Password',
                password_F,
              ),
              SizedBox(
                height: 10,
              ),
              ForgotPassword(),
              SizedBox(
                height: 10,
              ),
              SubmitButton('Log In'),
              SizedBox(
                height: 10,
              ),
              LoginOrSignup()
            ],
          ),
        ),
      ),
    );
  }

  Widget LoginOrSignup() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Don't you have account?",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "Sign up",
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

  Widget SubmitButton(String type) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF4E7D4C),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget ForgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
        style: TextStyle(fontSize: 18, color: Colors.black),
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: type,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              icon,
              color: focusNode.hasFocus ? Color(0xFF4E7D4C) : Colors.grey,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Color(0xFF4E7D4C),
                width: 2,
              ),
            )),
      ),
    );
  }
}
