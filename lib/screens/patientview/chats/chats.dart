import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

import 'category_selector.dart';
import 'favorite_contacts.dart';
import 'recent_charts.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.c6,
      appBar: AppBar(
        backgroundColor: Styles.c6,
        title: Text("Chats", style: Styles.headerStyle2),
        centerTitle: true,
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
                  FavoriteContacts(),
                  RecentChats(users: [],),
                  // FloatingActionButton.extended(
                  //   backgroundColor: Styles.c9,
                  //   onPressed: () {
                  //     // context.go("/single_chat");
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (_) => AllContacts(),
                  //       ),
                  //     );
                  //   },
                  //   label: Text(
                  //     "New chat",
                  //     style: Styles.headerStyle4.copyWith(color: Colors.white),
                  //   ),
                  //   icon: Icon(
                  //     Icons.add,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
