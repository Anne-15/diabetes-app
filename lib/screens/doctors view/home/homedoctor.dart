import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeDoctor extends StatelessWidget {
  const HomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Styles.headerStyle2,
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        backgroundColor: Styles.c6.withOpacity(0.1),
        actions: [
          Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Icon(
                Icons.notifications,
                color: Styles.c1,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey, get started here,",
                style: Styles.headerStyle3,
              ),
              Text(
                "Get to see the features on this page",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 20.0),
              Text(
                "Featured articles/reads",
                style: Styles.headerStyle2,
              ),
              SizedBox(height: 20.0),
              //Featured articles/reads
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Styles.c6.withOpacity(0.2),
                ),
                height: AppLayout.getHeight(130),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //column1 - image
                    Column(
                      children: [
                        Flexible(
                          child: Image(
                            image: AssetImage("assets/images/image.png"),
                          ),
                        ),
                      ],
                    ),
                    //text - column2
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How to manage a diabetic environment",
                          style: Styles.headerStyle4,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Lorem ipsum dolor sit amet",
                          style: Styles.headerStyle4,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 30.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Learn more",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              //community platform preview
              Text(
                "Community Platform",
                style: Styles.headerStyle2,
              ),
              SizedBox(height: 10.0),
              Text(
                "Connect with a community that helps you grow and find out more about diabetes",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Styles.c6,
                    ),
                    width: AppLayout.getWidth(50),
                    height: AppLayout.getHeight(50),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Styles.c6,
                    ),
                    width: AppLayout.getWidth(50),
                    height: AppLayout.getHeight(50),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Styles.c6,
                    ),
                    width: AppLayout.getWidth(50),
                    height: AppLayout.getHeight(50),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Styles.c6,
                    ),
                    width: AppLayout.getWidth(50),
                    height: AppLayout.getHeight(50),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Styles.c6,
                    ),
                    width: AppLayout.getWidth(50),
                    height: AppLayout.getHeight(50),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "View more",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                "Connect with your doctor",
                style: Styles.headerStyle2,
              ),
              SizedBox(height: 10.0),
              Text(
                "The doctor will schedule calls for regular check-ups at your convenience.",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 10.0),
              Container(
                height: AppLayout.getHeight(160),
                decoration: BoxDecoration(
                  color: Styles.c6.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_2_rounded,
                          color: Styles.c1,
                        ),
                        SizedBox(width: AppLayout.getHeight(30)),
                        Text("Dr. Agnes"),
                      ],
                    ),
                    SizedBox(height: AppLayout.getHeight(20)),
                    Row(
                      children: [
                        Icon(
                          Icons.local_hospital_outlined,
                          color: Styles.c1,
                        ),
                        SizedBox(width: AppLayout.getHeight(30)),
                        Text("Nairobi, Hospital"),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "view scheduled appointments",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
