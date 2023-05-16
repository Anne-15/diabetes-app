import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

import '../chats/chats.dart';
import 'blogs.dart';
import 'community.dart';
import 'mydoctor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              SizedBox(height: 5.0),
              //Featured articles/reads
              Text(
                "Read about other people's experience and learn",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 10.0),
              BlogPosts(),
              SizedBox(height: 30.0),
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
              CommunityPlatform(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatApp()));
                  },
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
              MyDoctor()
            ],
          ),
        ),
      ),
    );
  }
}

