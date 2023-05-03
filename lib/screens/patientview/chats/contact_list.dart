import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:android_testing/screens/patientview/chats/single_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

import 'category_selector.dart';
import 'favorite_contacts.dart';
import 'recent_charts.dart';

class AllContacts extends StatelessWidget {
  const AllContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.c6,
      appBar: AppBar(
        backgroundColor: Styles.c6,
        title: Center(
          child: Text("Chats", style: Styles.header1),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          CategorySelector(),
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SingleChat(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 5.0, bottom: 5.0, right: 20.0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundImage: AssetImage(
                                          'assets/images/profile.png'),
                                    ),
                                    SizedBox(width: AppLayout.getWidth(10.0)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Andrew Smith",
                                          style: Styles.headerStyle3,
                                        ),
                                        SizedBox(
                                            height: AppLayout.getHeight(5.0)),
                                        Text(
                                          "An apple a day keeps the doctor away",
                                          style: Styles.headerStyle4,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
