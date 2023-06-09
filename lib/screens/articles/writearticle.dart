import 'package:android_testing/models/addarticles.dart';
import 'package:android_testing/repository/articles_repository.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';

class MyArticles extends StatefulWidget {
  const MyArticles({super.key});

  @override
  State<MyArticles> createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {
  late TextEditingController title;
  late TextEditingController date;
  late TextEditingController body;

  @override
  void initState() {
    // TODO: implement initState
    title = TextEditingController();
    date = TextEditingController();
    body = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    title.dispose();
    date.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Blogs",
          style: Styles.headerStyle2,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Stack(
                children: [
                  SizedBox(
                    // width: 300,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/nature.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Styles.c1,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Styles.c12,
                        size: 20.0,
                      ),
                    ),
                  )
                ],
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
                  controller: title,
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
                  controller: date,
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
                  controller: body,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text("Body"),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: (() async {
                    final article = ArticlesModel(
                      title: title.text.trim(),
                      date: date.text.trim(),
                      body: body.text.trim(),
                    );
                    await ArticleRepository.instance.addArticles(article);

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }),
                  label: Text(
                    "Send",
                    style: Styles.headerStyle4,
                  ),
                  icon: Icon(
                    Icons.send_rounded,
                    color: Styles.c1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
