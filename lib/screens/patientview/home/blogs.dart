import 'package:flutter/material.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../articles/single_article.dart';

class BlogPosts extends StatelessWidget {
  const BlogPosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleArticle()));
                  },
                  child: Text(
                    "Learn more",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
