import 'package:android_testing/controllers/get_doctors_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';
import '../../../models/doctormodel.dart';
import 'mesages_list.dart';
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
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: MyMessages(
                          senderId: userid,
                          recipientId: widget.user.fullname,
                        ),
                      ),
                    ),
                    NewMessage(
                      senderId: userid,
                      receipientId: widget.user.fullname,
                    ),
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
