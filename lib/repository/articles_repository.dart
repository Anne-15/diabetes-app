import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/addarticles.dart';

class ArticleRepository extends GetxController {
  static ArticleRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

//store data in firestore
  addArticles(ArticlesModel article) async {
    await _db
        .collection("Articles")
        .add(article.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your blog has been created.",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        // ignore: avoid_types_as_parameter_names, body_might_complete_normally_catch_error, non_constant_identifier_names
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

//fetch all the data
  Future<ArticlesModel> getarticlesDetails(String title) async {
    final snapshot =
        await _db.collection("Articles").where("title", isEqualTo: title).get();
    final data =
        snapshot.docs.map((e) => ArticlesModel.fromFirestore(e)).single;
    return data;
  }

  Future<List<ArticlesModel>> allArticles() async {
    final snapshot = await _db.collection("Articles").get();
    final data =
        snapshot.docs.map((e) => ArticlesModel.fromFirestore(e)).toList();
    return data;
  }

//only get the latest article/blog
  Future<ArticlesModel> getLatestArticle() async {
    final snapshot = await _db
        .collection("Articles")
        .orderBy("date", descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final data =
          snapshot.docs.map((e) => ArticlesModel.fromFirestore(e)).single;
      return data;
    } else {
      throw Exception("No articles found");
    }
  }
}
