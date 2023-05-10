import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

import '../../../repository/doctors_chat_repository.dart';
import '../../patientview/chats/contact_list.dart';
import '../../patientview/chats/favorite_contacts.dart';
import '../../patientview/chats/recent_charts.dart';
import 'doctor_category.dart';
import 'doctor_contacts.dart';

class DoctorChats extends StatelessWidget {
  const DoctorChats({super.key});

  @override
  Widget build(BuildContext context) {
    final chatrepo = DoctorChatRepository();

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
                  FavoriteContacts(),
                  RecentChats(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton.extended(
                      backgroundColor: Styles.c9,
                      onPressed: () {
                        // context.go("/single_chat");
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => DoctorContacts(
                        //       item: chatrepo,
                        //     ),
                        //   ),
                        // );
                      },
                      label: Text(
                        "New chat",
                        style:
                            Styles.headerStyle4.copyWith(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
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
