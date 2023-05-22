import 'package:android_testing/controllers/articles_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../models/addarticles.dart';

class BlogPosts extends StatelessWidget {
  const BlogPosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticlesController());
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<ArticlesModel>(
      future: controller.getLatestArticle(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
                final article = snapshot.data!;
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          "assets/images/nature.png",
                          width: 80,
                          height: 80,
                        ),
                        title: Text(
                          article.title,
                          style: Styles.headerStyle2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.body,
                              style: Styles.headerStyle4,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Date: ${article.date}",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppLayout.getHeight(10)),
                    ],
                  ),
                );
              
            
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: Text("Nothing to show for now"),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


