import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart' as AppUser;

class AuthFailure {
  final String message;
  AuthFailure({
    required this.message,
  });
}

class UserService {
  static bool get isSignedIn =>
      FirebaseAuth.instance.currentUser != null ? true : false;

  static String getUserId() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    }
    throw AuthFailure(message: "User not found");
  }

  static String getEmail() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email!;
    }
    throw AuthFailure(message: "User not found");
  }

  static Future<AppUser.User> getCurrentUser() async {
    try {
      final id = getUserId();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final userSnapshot = await firestore.collection('user').doc(id).get();
      return AppUser.User.fromMap(userSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      throw AuthFailure(message: e.toString());
    }
  }

  static Future<AppUser.User> getUserById(String id) async {
    try {
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('user').doc(id).get();

      if (userSnapshot.exists) {
        final Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        return AppUser.User.fromMap(userData);
      } else {
        throw AuthFailure(message: 'User not found');
      }
    } catch (e) {
      throw AuthFailure(message: e.toString());
    }
  }

  static Future<void> userLogin(
      BuildContext context, String userEmail, String userPassword) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw AuthFailure(message: 'Invalid login credentials');
      } else {
        throw AuthFailure(message: "Unknown error occurred");
      }
    } catch (e) {
      throw AuthFailure(message: "Unknown error occurred");
    }
  }

  static Future<void> userLogOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> userRegister(
    String username,
    String userEmail,
    String? userPhone,
    List<String>? userOccupations, // List of occupations
    int? mainOccupationIndex, // Index of main occupation
    String? profilePicture,
    String? bio,
    String? city,
    String? state,
    String? country,
    DateTime? dateOfBirth,
    String userPassword,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      final user = userCredential.user;

      // Create user data in Firestore
      await FirebaseFirestore.instance.collection('user').doc(user!.uid).set({
        "id": user.uid,
        "username": username,
        "email": userEmail,
        "phone": userPhone,
        "occupations": userOccupations ?? [],
        "mainOccupationIndex": mainOccupationIndex,
        "profilePicture": profilePicture,
        "bio": bio,
        "city": city,
        "state": state,
        "country": country,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "isVerified": false,
        "bookmarkedNewsPosts": [],
        "bookmarkedQuestionPosts": [],
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'EMAIL_ALREADY_IN_USE') {
        throw AuthFailure(message: 'Email already in use');
      } else {
        throw AuthFailure(message: "Unknown error occurred");
      }
    } catch (e) {
      throw AuthFailure(message: e.toString());
    }
  }

  static Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } catch (e) {
      throw AuthFailure(message: "Failed to send email verification");
    }
  }

  static bool isVerified() {
    final user = FirebaseAuth.instance.currentUser;
    return user?.emailVerified ?? false;
  }

  static Future<void> checkEmailVerificationStatus({
    required Function(int) onWaiting,
    required Function() onSucceed,
    required Function() onWaitingEnd,
    required Function(AuthFailure) onFailed,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      bool isSucceed = false;
      for (var i = 0; i < 30; i++) {
        await Future.delayed(const Duration(seconds: 1));
        await user.reload();
        if (user.emailVerified) {
          isSucceed = true;
          break;
        }
        onWaiting(i);
      }
      if (isSucceed) {
        onSucceed();
      } else {
        onWaitingEnd();
      }
    } else {
      onFailed(AuthFailure(message: "User not found"));
    }
  }

  static Future<void> resetPassword(
      String userEmail, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: userEmail,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User not found"),
          ),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  // Fetch username by userId
  static Future<String> getUserNameById(String userId) async {
    try {
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('user').doc(userId).get();
      if (userSnapshot.exists) {
        final userData = userSnapshot.data() as Map<String, dynamic>;
        return userData['name'] ??
            'Unknown'; // Return 'Unknown' if name is not found
      } else {
        return 'Unknown';
      }
    } catch (e) {
      throw 'Failed to get user name: $e';
    }
  }
}
