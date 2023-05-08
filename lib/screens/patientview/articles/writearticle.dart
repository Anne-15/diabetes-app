import 'package:android_testing/models/addarticles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../controllers/articles_controllers.dart';

class MyArticles extends StatelessWidget {
  const MyArticles({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticlesController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Articles",
          style: Styles.headerStyle2,
          // textAlign: TextAlign.center,
        ),
        centerTitle: true,
        // elevation: 0,
        // backgroundColor: Styles.c6.withOpacity(0.2),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Share your experiences and journey with others,",
                style: Styles.headerStyle2,
              ),
              SizedBox(height: 10.0),
              Text(
                "It is also a way to manage and deal with stress along the journey",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: TextField(
                  controller: controller.title,
                  decoration: InputDecoration(
                    label: Text("Title"),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: TextField(
                  controller: controller.date,
                  decoration: InputDecoration(
                    label: Text("Date"),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: TextField(
                  controller: controller.body,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text("Body"),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("Image"),
                    border: InputBorder.none,
                    icon: Icon(Icons.add_a_photo_outlined, color: Styles.c1),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.extended(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    label: Text(
                      "Save draft",
                      style: Styles.headerStyle4,
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: (() {
                      final article = ArticlesModel(
                        title: controller.title.text.trim(),
                        date: controller.date.text.trim(),
                        body: controller.body.text.trim(),
                      );
                      ArticlesController.instance.addArticles(article);
                    }),
                    label: Text(
                      "Send",
                      style: Styles.headerStyle4,
                    ),
                    icon: Icon(
                      Icons.send_rounded,
                      color: Styles.c1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
