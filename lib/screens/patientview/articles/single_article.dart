import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

class SingleArticle extends StatelessWidget {
  const SingleArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160.0,
              color: Styles.c1,
              child: Center(
                child: Text("image goes here"),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Styles.c9,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Text("Title"),
                  Text("Body"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
