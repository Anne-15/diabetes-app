// import 'package:android_testing/models/usermodel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// import '../../../components/constants.dart';
// import '../../../models/messages.dart';
// import '../../../repository/chats_repository.dart';

// class SingleChat extends StatefulWidget {
//   const SingleChat({super.key});

//   @override
//   State<SingleChat> createState() => _SingleChatState();
// }

// class _SingleChatState extends State<SingleChat> {

//   // late final Chat chat;
//   late final String chatId;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Styles.c6,
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios_new_outlined),
//             iconSize: 30,
//             color: Colors.white,
//           ),
//         ],
//         backgroundColor: Styles.c6,
//         title: Text(
//           "Contact Name",
//           style: Styles.headerStyle2,
//         ),
//         // centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30.0),
//                   topRight: Radius.circular(30.0),
//                 ),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30.0),
//                   topRight: Radius.circular(30.0),
//                 ),
//                 child: StreamBuilder<List<Messages>>(
//                   stream: 
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text('Error: ${snapshot.error}'),
//                       );
//                     }
//                     if (!snapshot.hasData) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     final message = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: message.length,
//                       reverse: true,
//                       itemBuilder: (context, index) {
//                         final messages = message[index];
//                         return MessageItem(
//                           message: messages,
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MessageItem extends StatelessWidget {
//   final Messages message;
//   const MessageItem({super.key, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // CircleAvatar(
//           //   child: Text(message.senderId.substring(0, 1)),
//           // ),
//           SizedBox(
//             width: 8.0,
//           ),
//           Expanded(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(message.message),
//               // Text()
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }
