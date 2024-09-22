//news service
// import 'dart:convert';
import 'dart:io';

import 'package:agro_connect/models/news_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NewsService {
  // static Future<List<News>> getAll() async {
  //   try {
  //     final List<dynamic> res = json.decode(newsRes);
  //     final List<News> newses =
  //         res.map((e) => News.fromMap(e as Map<String, dynamic>)).toList();
  //     return newses;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  static Future<String> addNews(
    String userId,
    String headline,
    String newsContent,
    String? imageUrl,
    int timeStamp,
  ) async {
    try {
      final doc = FirebaseFirestore.instance.collection('News').doc();
      final storageRef =
          FirebaseStorage.instance.ref().child('news_media/$doc.id');
      final UploadTask = storageRef.putFile(File(imageUrl!));
      await UploadTask.whenComplete(() async {
        final imageUrl = await storageRef.getDownloadURL();
        await doc.set({
          'id': doc.id,
          'userId': userId,
          'image': doc.id, // Use the document ID as the image identifier
          'time': timeStamp,
          'headline': headline,
          'newsContent': newsContent,
          'imageUrl': imageUrl,
        });
      });
      return doc.id;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<News>> getAllNewses() async {
    final newsCollection = FirebaseFirestore.instance.collection('news');
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
