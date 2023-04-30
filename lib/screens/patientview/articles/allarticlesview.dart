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
    final controller = Get.put(GetArticlesController());
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Articles",
            style: Styles.headerStyle1,
          ),
        ),
        elevation: 0,
        backgroundColor: Styles.c6.withOpacity(0.2),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: FutureBuilder<List<ArticlesModel>>(
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
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

//  Card(
//             child: Column(
//               children: [
//                 Image.network(
//                   'https://via.placeholder.com/300x200',
//                   fit: BoxFit.cover,
//                 ),
//                 ListTile(
//                   title: Text('Title'),
//                   subtitle: Text('Subtitle'),
//                 ),
//               ],
//             ),
//           )
