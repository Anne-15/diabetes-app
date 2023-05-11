// import 'package:android_testing/models/messages.dart';
// import 'package:android_testing/models/usermodel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class ChatRepository extends GetxController {
//   static ChatRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance;

//   // Create a new chat
//   Future<void> createChat(UserModel receiver) async {
//     final chatId = _db.collection('chats').doc().id;
//     final senderId = FirebaseAuth.instance.currentUser!.uid;
//     final messagesRef =
//         _db.collection('chats').doc(chatId).collection('messages');
//     await messagesRef.add({
//       'message': 'Chat started',
//       'senderId': senderId,
//       'receiverId': receiver.id,
//       'timestamp': Timestamp.now(),
//     });
//   }

//   // Add a new message to an existing chat
//   Future<void> addMessageToChat(Chat chat, String message) async {
//     final senderId = FirebaseAuth.instance.currentUser!.uid;
//     final messagesRef =
//         _db.collection('chats').doc(chat.chatId).collection('messages');
//     await messagesRef.add({
//       'message': message,
//       'senderId': senderId,
//       'receiverId': chat.receiver.id,
//       'timestamp': Timestamp.now(),
//     });
//   }

//   // Retrieve all messages for a specific chat
//   Stream<List<Messages>> getMessagesForChat(String chatId) {
//     final messagesRef = _db
//         .collection('chats')
//         .doc(chatId)
//         .collection('messages')
//         .orderBy('timestamp', descending: true);
//     return messagesRef.snapshots().map((snapshot) {
//       return snapshot.docs
//           .map((doc) => Messages(
//                 messageId: doc.id,
//                 senderId: doc['senderId'],
//                 senderName: doc['senderName'],
//                 receiverId: doc['receiverId'],
//                 receiverName: doc['receiverName'],
//                 message: doc['message'],
//                 timestamp: doc['timestamp'],
//               ))
//           .toList();
//     });
//   }
// }