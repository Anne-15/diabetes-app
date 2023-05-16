import 'package:android_testing/models/addarticles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../controllers/articles_controllers.dart';

class AddDoctorDetails extends StatefulWidget {
  const AddDoctorDetails({super.key});

  @override
  State<AddDoctorDetails> createState() => _AddDoctorDetailsState();
}

class _AddDoctorDetailsState extends State<AddDoctorDetails> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticlesController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Doctors",
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
                "My doctor's details",
                style: Styles.headerStyle2,
              ),
              SizedBox(height: 15.0),
              Text(
                "Add your specialist details to get in touch.",
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
                  controller: controller.title,
                  decoration: InputDecoration(
                    label: Text("Name"),
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
                    label: Text("Hospital"),
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
                    label: Text("Department"),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: (() {
                    final article = ArticlesModel(
                      title: controller.title.text.trim(),
                      date: controller.date.text.trim(),
                      body: controller.body.text.trim(),
                    );
                    ArticlesController.instance.addArticles(article);
                  }),
                  label: Text(
                    "Save",
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
