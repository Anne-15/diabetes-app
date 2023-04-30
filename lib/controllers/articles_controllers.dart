import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/addarticles.dart';
import '../repository/articles_repository.dart';

class ArticlesController extends GetxController {
  static ArticlesController get instance => Get.find();

  // final _db = FirebaseFirestore.instance;

  //text field controllers to get data from the text fields
  final title = TextEditingController();
  final date = TextEditingController();
  final body = TextEditingController();

  final articleRepo = Get.put(ArticleRepository());

  void addArticles(ArticlesModel article) async {
    await articleRepo.addArticles(article);
    Get.to(() => '/navbar');
  }
}
