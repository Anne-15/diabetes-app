// import 'dart:convert';

// import 'package:android_testing/auth.dart';
// import 'package:android_testing/middleware/config.dart';
// import 'package:android_testing/models/doctormodel.dart';
// import 'package:android_testing/models/messages.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class DoctorChatRepository extends GetxController {
//   static DoctorChatRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance;

//   goChat(DoctorUserModel userData) async {
//     var fromMessages = await _db
//         .collection('messages')
//         .withConverter(
//             fromFirestore: Messages.fromFirestore,
//             toFirestore: (Messages msg, options) => msg.toJson())
//         .where('senderId', isEqualTo: token)
//         .where('receiverId', isEqualTo: userData.id)
//         .get();

//     var toMessages = await _db
//         .collection('messages')
//         .withConverter(
//             fromFirestore: Messages.fromFirestore,
//             toFirestore: (Messages msg, options) => msg.toJson())
//         .where('senderId', isEqualTo: userData.id)
//         .where('receiverId', isEqualTo: token)
//         .get();

//     if (fromMessages.docs.isEmpty && toMessages.docs.isEmpty) {
//       String profile = await ConfigDataStore.to.getProfile();
//       DoctorUserModel doctorData =
//           DoctorUserModel.fromFirestore(jsonDecode(profile));
//       var msgdata = Messages(
//         senderId: doctorData.id,
//         message: '',
//         timestamp: Timestamp.now(),
//       );
//       _db
//           .collection('messages')
//           .withConverter(
//               fromFirestore: Messages.fromFirestore,
//               toFirestore: (Messages msg, options) => msg.toJson())
//           .add(msgdata)
//           .then((value) => {
//                 Get.toNamed(
//                   '/chat',
//                   parameters: {
//                     "message_id": value.id,
//                     "senderId": userData.id ?? '',
//                     "senderName": userData.fullname,
//                   },
//                 ),
//               });
//     } else {
//       if (fromMessages.docs.isNotEmpty) {
//         Get.toNamed(
//           '/chat',
//           parameters: {
//             "message_id": fromMessages.docs.first.id,
//             "senderId": userData.id ?? '',
//             "senderName": userData.fullname,
//           },
//         );
//       }
//       if (toMessages.docs.isNotEmpty) {
//         Get.toNamed(
//           '/chat',
//           parameters: {
//             "message_id": toMessages.docs.first.id,
//             "senderId": userData.id ?? '',
//             "senderName": userData.fullname,
//           },
//         );
//       }
//     }
//   }
// }
