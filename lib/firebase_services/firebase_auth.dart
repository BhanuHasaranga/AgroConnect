import 'dart:io';

import 'package:agro_connect/util/excption.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> Signup({
    required String username,
    required String email,
    required String password,
    required String passwordConfirm,
    required File? profilePic,
  }) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        if (password == passwordConfirm) {
          await _auth.createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
        } else {
          throw exceptions("password and confirm password should be the same");
        }
      } else {
        throw exceptions("username, email and password should not be empty");
      }
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    }
  }
}
