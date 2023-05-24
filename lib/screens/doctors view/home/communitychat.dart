import 'package:flutter/material.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';

class CommunityChat extends StatelessWidget {
  const CommunityChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
