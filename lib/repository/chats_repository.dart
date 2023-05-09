import 'package:android_testing/models/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../auth.dart';

class ChatRepository extends GetxController {
  static ChatRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //chat feature
  goChat(Messages _toUserData) async {
    var from_messages = await _db
        .collection("messages")
        .withConverter(
            fromFirestore: Messages.fromFirestore,
            toFirestore: (Messages msg, options) => msg.toJson())
        .where("senderId", isEqualTo: token)
        .where("receiverId", isEqualTo: _toUserData.receiverId);
  }
}
