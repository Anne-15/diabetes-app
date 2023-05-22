import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:android_testing/models/doctormodel.dart';
import 'package:android_testing/screens/doctors%20view/chats/doctor_category.dart';
import 'package:android_testing/screens/doctors%20view/chats/individual_chat.dart';
import 'package:flutter/material.dart';

import '../../../repository/doctors_chat_repository.dart';

// ignore: must_be_immutable
class DoctorContacts extends StatelessWidget {
  DoctorUserModel item;
  DoctorContacts({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // final chatrepo = DoctorChatRepository();
    // chatrepo.goChat(item);

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
                                    builder: (_) => IndividualChat(),
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
