import 'package:android_testing/controllers/get_doctors_controllers.dart';
import 'package:android_testing/screens/patientview/chats/chats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';
import '../../../models/doctormodel.dart';
import 'new_message.dart';

class SingleChat extends StatefulWidget {
  final DoctorUserModel user;
  const SingleChat({super.key, required this.user});

  @override
  State<SingleChat> createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChat> {
  final controllers = Get.put(DoctorSignupController());

  @override
  Widget build(BuildContext context) {
    var user;
    return Scaffold(
      backgroundColor: Styles.c6,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatApp()));
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          iconSize: 30,
          color: Colors.white,
        ),
        backgroundColor: Styles.c6,
        title: Text(
          "Contact Name",
          style: Styles.headerStyle2,
        ),
        // centerTitle: true,
      ),
      body: Column(
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
                child: Column(
                  children: [
                    // MyMessages(senderId: user),
                    NewMessage(senderId: user),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

