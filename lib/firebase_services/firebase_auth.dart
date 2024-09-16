import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:agro_connect/util/excption.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  //signUp method
  Future<User?> signUp({
    required String username,
    required String email,
    required String password,
    required String passwordConfirm,
    File? profilePic,  // Made profilePic optional
  }) async {
    try {
      // Validate input
      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        throw exceptions("Username, email, and password should not be empty.");
      }

      if (password != passwordConfirm) {
        throw exceptions("Passwords do not match.");
      }

      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // If profilePic is provided, upload it
      if (profilePic != null) {
        String imageUrl = await _uploadProfilePic(userCredential.user!.uid, profilePic);

        // Update user profile with display name and profile picture URL
        await userCredential.user!.updateProfile(
          displayName: username,
          photoURL: imageUrl,
        );
      } else {
        // Only update the display name if no profile picture is provided
        await userCredential.user!.updateProfile(
          displayName: username,
        );
      }

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw exceptions("Email is already in use.");
      } else if (e.code == 'invalid-email') {
        throw exceptions("The email address is invalid.");
      } else if (e.code == 'weak-password') {
        throw exceptions("The password is too weak.");
      } else {
        throw exceptions(e.message ?? "An unknown error occurred.");
      }
    } catch (e) {
      throw exceptions("An unexpected error occurred: ${e.toString()}");
    }
  }

  // Helper function to upload profile picture to Firebase Storage
  Future<String> _uploadProfilePic(String userId, File profilePic) async {
    try {
      Reference ref = _storage.ref().child('profile_pics/$userId.jpg');
      UploadTask uploadTask = ref.putFile(profilePic);

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      return await snapshot.ref.getDownloadURL(); // Return the image URL
    } catch (e) {
      throw exceptions("Failed to upload profile picture: ${e.toString()}");
    }
  }

  //login
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw exceptions("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        throw exceptions("Wrong password provided.");
      } else {
        throw exceptions(e.message ?? "An unknown error occurred.");
      }
    } catch (e) {
      throw exceptions("An unexpected error occurred: ${e.toString()}");
    }
  }
}
