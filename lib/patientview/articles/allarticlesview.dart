import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

import '../../components/app_layout.dart';
import '../../components/constants.dart';

class MyArticles extends StatefulWidget {
  const MyArticles({super.key});

  @override
  State<MyArticles> createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(20),
                vertical: AppLayout.getHeight(45)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Articles",
                  style: Styles.header1,
                ),
                Icon(Icons.notifications)
              ],
            ),
          ),
          ListView(
            padding: EdgeInsets.all(20),
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: AppLayout.getHeight(20),
                    bottom: AppLayout.getHeight(10),
                    left: AppLayout.getWidth(20),
                    right: AppLayout.getWidth(20)),
                child: Row(children: [
                  //image section
                  Container(
                    width: AppLayout.getWidth(100),
                    height: AppLayout.getHeight(90),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Styles.c1),
                  ),
                  //text container
                  Expanded(
                    child: Container(
                      height: AppLayout.getHeight(90),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        // color: kPrimaryLightColor
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: AppLayout.getWidth(10),
                            top: AppLayout.getHeight(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The Future of Insulin: A list of new insulin formulations under development",
                              style: Styles.headerStyle3.copyWith(fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text(
                              "Here you can find a summary of most known insulin formulations under development. We also mention insulins which have recently appeared on the market",
                              style: Styles.headerStyle4.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
