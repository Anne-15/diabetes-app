import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SafeArea(
            child: Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 24),
      height: AppLayout.getHeight(55),
      decoration: BoxDecoration(
        color: Styles.c4.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.home,
            color: Styles.c1,
          ),
          Icon(
            Icons.newspaper,
            color: Styles.c1,
          ),
          Icon(
            Icons.schedule,
            color: Styles.c1,
          ),
          Icon(
            Icons.chat_bubble_outline_rounded,
            color: Styles.c1,
          ),
          Icon(
            Icons.person_2_rounded,
            color: Styles.c1,
          )
        ],
      ),
    )));
  }
}
