import 'package:android_testing/controllers/signup_controller.dart';
import 'package:android_testing/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';
import 'widgets/my_new_message.dart';
import 'widgets/mymessage.dart';

class IndividualChat extends StatefulWidget {
  final UserModel user;
  const IndividualChat({super.key, required this.user});

  @override
  State<IndividualChat> createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  final controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    final userid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: Styles.c6,
      appBar: AppBar(
        backgroundColor: Styles.c6,
        title: Text(
          widget.user.fullname,
          style: Styles.headerStyle2,
        ),
        centerTitle: true,
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
                child: MyMessage(
                  senderId: userid,
                  recipientId: widget.user.fullname,
                ),
              ),
            ),
          ),
          MyNewMessage(
            senderId: userid,
            recipientId: widget.user.fullname,
          )
        ],
      ),
    );
  }
}