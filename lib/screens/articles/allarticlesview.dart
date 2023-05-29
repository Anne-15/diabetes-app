import 'package:android_testing/screens/articles/single_article.dart';
import 'package:android_testing/screens/articles/writearticle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_layout.dart';
import '../../components/constants.dart';
import '../../controllers/articles_controllers.dart';
import '../../models/addarticles.dart';

class AllArticles extends StatelessWidget {
  const AllArticles({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(ArticlesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Articles",
          style: Styles.headerStyle2,
        ),
        // elevation: 0,
        // backgroundColor: Styles.c6.withOpacity(0.2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Share your experiences and journey with others.",
                style: Styles.headerStyle2,
              ),
              SizedBox(height: 15.0),
              Text(
                "It is also a way to manage and deal with stress along the journey and help other people to mange the chronic illness",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 30.0),
              FutureBuilder<List<ArticlesModel>>(
                future: controller.getAllArticles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (i, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SingleArticle(
                                      article: snapshot.data![index]),
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
                                      snapshot.data![index].title,
                                      style: Styles.headerStyle2,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].body,
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
                                            "Date: ${snapshot.data![index].date}",
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
                        },
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
              ),
              SizedBox(height: size.height * 0.04),
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyArticles(),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
