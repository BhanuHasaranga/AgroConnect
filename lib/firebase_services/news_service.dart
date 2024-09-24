//news service
// import 'dart:convert';
import 'dart:io';

import 'package:agro_connect/models/news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NewsService {
  static Future<String> addNews(
    String userId,
    String headline,
    String newsContent,
    String? imageUrl,
    int timeStamp,
  ) async {
    try {
      final doc = FirebaseFirestore.instance.collection('News').doc();
      String? uploadedImageUrl;

      // If an image is selected, upload it to Firebase Storage
      if (imageUrl != null && imageUrl.isNotEmpty) {
        final storageRef =
            FirebaseStorage.instance.ref().child('news_media/$doc.id');
        final uploadTask = storageRef.putFile(File(imageUrl));

        final taskSnapshot = await uploadTask.whenComplete(() {});
        uploadedImageUrl = await taskSnapshot.ref.getDownloadURL();
      }

      // Set the document in Firestore, using the uploaded image URL if available
      await doc.set({
        'id': doc.id,
        'userId': userId,
        'headline': headline,
        'newsContent': newsContent,
        'imageUrl': uploadedImageUrl ??
            '', // If no image, store an empty string or null
        'time': timeStamp,
      });

      return doc.id;
    } catch (e) {
      print('Error posting news: $e');
      throw 'Failed to post news: $e';
    }
  }

  static Future<List<News>> getAllNewses() async {
    final newsCollection = FirebaseFirestore.instance.collection('News');
    try {
      final querySnapShot = await newsCollection.get();
      final List<News> newses =
          querySnapShot.docs.map((doc) => News.fromMap(doc.data())).toList();
      return newses;
    } catch (e) {
      throw e.toString();
    }
  }

  static Stream<List<News>> listenGetAllNewses() async* {
    final newsCollection = FirebaseFirestore.instance.collection('news');
    try {
      yield* newsCollection.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => News.fromMap(doc.data())).toList();
      });
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<News> getEventById(String id) async {
    try {
      print(id);
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('event').doc(id).get();

      final Map<String, dynamic> eventData =
          userSnapshot.data() as Map<String, dynamic>;

      final News event = News.fromMap(eventData);

      return event;
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
