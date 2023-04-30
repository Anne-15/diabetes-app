import 'package:android_testing/models/addarticles.dart';
import 'package:get/get.dart';

import '../repository/articles_repository.dart';

class GetArticlesController extends GetxController {
  static GetArticlesController get instance => Get.find();

  final _articleRepo = Get.put(ArticleRepository());

//get all the list of articles
  Future<List<ArticlesModel>> getAllArticles() async {
    return await _articleRepo.allArticles();
  }
}
