import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

import 'doctor_category.dart';
import 'recentchat.dart';

class DoctorChats extends StatelessWidget {
  const DoctorChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.c6,
      appBar: AppBar(
        backgroundColor: Styles.c6,
        title: Text("Chats", style: Styles.headerStyle2),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          DoctorCategories(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Styles.c12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  RecentChat(users: [],),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
