import 'package:android_testing/components/constants.dart';
import 'package:android_testing/models/addarticles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleRepository extends GetxController {
  static ArticleRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

//adding to the database
  createArticle(ArticlesModel article) async {
    await _db
        .collection("Articles")
        .add(article.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your articles has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Styles.c6,
              colorText: Colors.black),
        )

        // ignore: avoid_types_as_parameter_names, body_might_complete_normally_catch_error, non_constant_identifier_names
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Styles.c9,
          colorText: Colors.white);
      print(error.toString());
    });
  }
}
