import 'package:android_testing/screens/patientview/articles/writearticle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../controllers/get_articles_controller.dart';
import '../../../models/addarticles.dart';

class AllArticles extends StatelessWidget {
  const AllArticles({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(GetArticlesController());
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
              FutureBuilder<List<ArticlesModel>>(
                future: controller.getAllArticles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (i, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Image(
                                  image: AssetImage("assets/images/image.png"),
                                ),
                                title: Text(
                                  snapshot.data![index].title,
                                  style: Styles.headerStyle3,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].body,
                                      style: Styles.headerStyle4,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          "Date: ${snapshot.data![index].date}"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: AppLayout.getHeight(8)),
                            ],
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
              SizedBox(height: size.height * 0.05),
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
