import 'package:flutter/material.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    required this.size,
  });

  final size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // upcoming meetings
        Container(
          width: size.width * .43,
          padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(AppLayout.getHeight(50)),
            ),
            color: Styles.c2,
          ),
          child: const Center(child: Text("Upcoming Meetings")),
        ),
        // past meetings/history
        Container(
          width: size.width * .42,
          padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(AppLayout.getHeight(50)),
            ),
            color: Styles.c1,
          ),
          child: const Center(child: Text("History")),
        ),
      ],
    );
  }
}
