import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../controllers/articles_controllers.dart';
import '../../../models/addarticles.dart';
import '../../articles/single_article.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticlesController());
    return FutureBuilder<ArticlesModel>(
      future: controller.getLatestArticle(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final article = snapshot.data!;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleArticle(article: article,),
                  ),
                );
              },
              child: Card(
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
