import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import '../../components/app_layout.dart';
import '../../components/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: Column(
        children: [
          //top part, home and notification icon.
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(20),
                vertical: AppLayout.getHeight(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Home",
                  style: Styles.header1,
                ),
                Icon(Icons.notifications)
              ],
            ),
          ),
          //card for featured articles
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: AppLayout.getHeight(180),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Styles.c4,
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHeight(20))),
                  child: Column(
                    children: [
                      Text("Image goes here"),
                      Gap(AppLayout.getHeight(20)),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          //community view
        ],
      ),
    );
  }
}
