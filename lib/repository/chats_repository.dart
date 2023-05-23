import 'package:android_testing/models/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/doctormodel.dart';

class ChatRepository extends GetxController {
  static ChatRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Create a new chat
  Future<void> createChat(DoctorUserModel receiver) async {
    final chatId = _db.collection('chats').doc().id;
    final senderId = FirebaseAuth.instance.currentUser!.uid;
    final messagesRef =
        _db.collection('Chats').doc(chatId).collection('messages');
    await messagesRef.add({
      'message': 'Chat started',
      'senderId': senderId,
      'receiverId': receiver.id,
      'timestamp': Timestamp.now(),
    });
  }

  // Add a new message to a chat
  Future<void> addMessageToChat(
      String senderId, String recipientId, String message) async {
    // ignore: unnecessary_brace_in_string_interps
    final chatId = '${senderId}_${recipientId}';
    final messagesRef =
        _db.collection('Chats').doc(chatId).collection('messages');
    await messagesRef.add({
      'message': message,
      'senderId': senderId,
      'timestamp': Timestamp.now(),
    });

    final refUsers = FirebaseFirestore.instance.collection('Doctors');
    await refUsers.doc(senderId).update(
      {
        'lastMessage': message,
      },
    );
  }

  // Retrieve all messages for a specific chat
  Stream<List<Messages>> getMessagesForChat(
    String senderId,
    String recipientId,
  ) {
    final chatId = '${senderId}_$recipientId';
    final messagesRef = _db
        .collection('Chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true);
    return messagesRef.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Messages(
                senderId: doc['senderId'],
                message: doc['message'],
                timestamp: doc['timestamp'],
              ))
          .toList();
    });
  }

  //get last message from the chat
  Future<QuerySnapshot> getLastMessageFromChat(String chatid) {
    return _db
        .collection('Chats')
        .doc(chatid)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();
  }
}
