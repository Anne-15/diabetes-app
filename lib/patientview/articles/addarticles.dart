import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/models/addarticles.dart';
import 'package:android_testing/patientview/articles/allarticlesview.dart';
import 'package:android_testing/repositories/createarticles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../components/constants.dart';

class WriteArticle extends StatefulWidget {
  const WriteArticle({super.key});

  @override
  State<WriteArticle> createState() => _WriteArticleState();
}

class _WriteArticleState extends State<WriteArticle> {
  late final TextEditingController _title;
  late final TextEditingController _date;
  late final TextEditingController _body;

  final articleRepo = Get.put(ArticleRepository());

  void createArticle(ArticlesModel article) async {
    await articleRepo.createArticle(article);
  }

  @override
  void initState() {
    // TODO: implement initState
    _title = TextEditingController();
    _date = TextEditingController();
    _body = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _title.dispose();
    _date.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getHeight(30),
              vertical: AppLayout.getHeight(100)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Write an article",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.035,
                ),
              ),
              Text(
                "Share your journey and experience to inspire and motivate others",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: size.height * 0.015,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
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
                  controller: _title,
                  decoration: InputDecoration(
                    hintText: "title",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
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
                  controller: _date,
                  decoration: InputDecoration(
                    hintText: "date",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
                height: AppLayout.getHeight(300),
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
                  controller: _body,
                  decoration: InputDecoration(
                    hintText: "body",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
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
                    hintText: "add image",
                    icon: Icon(Icons.add_a_photo_outlined, color: Styles.c9),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.extended(
                    backgroundColor: Colors.white,
                    onPressed: (() {}),
                    label: Text(
                      "Save draft",
                      style: Styles.headerStyle4,
                    ),
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Styles.c6,
                    onPressed: (() async {
                      ArticlesModel(
                        title: _title.text,
                        date: _date.text,
                        body: _body.text,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyArticles();
                          },
                        ),
                      );
                    }),
                    label: Text(
                      "Send",
                      style: Styles.headerStyle4,
                    ),
                    icon: Icon(
                      Icons.send_rounded,
                      color: Styles.c9,
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
