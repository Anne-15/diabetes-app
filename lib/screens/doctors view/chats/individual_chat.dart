import 'package:android_testing/controllers/signup_controller.dart';
import 'package:android_testing/models/messages.dart';
import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/repository/chats_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';

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

class MyMessage extends StatefulWidget {
  final String senderId;
  final String recipientId;
  const MyMessage({
    super.key,
    required this.senderId,
    required this.recipientId,
  });

  @override
  State<MyMessage> createState() => _MyMessageState();
}

class _MyMessageState extends State<MyMessage> {
  final chats = Get.put(ChatRepository());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Messages>>(
      stream: chats.getMessagesForChat(widget.senderId, widget.recipientId),
      builder: ((context, snapshot) {
        final messages = snapshot.data!;
        return messages.isEmpty
            ? Center(
                child: Text('Say hi...'),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return MessageWidget(
                    message: message,
                    isMe: message.senderId == widget.senderId,
                  );
                });
      }),
    );
  }
}

class MessageWidget extends StatefulWidget {
  final Messages message;
  final bool isMe;
  const MessageWidget({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!widget.isMe)
          CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          constraints: BoxConstraints(maxWidth: 140),
          decoration: BoxDecoration(
            color: widget.isMe ? Styles.c6 : Styles.c2,
            borderRadius: widget.isMe
                ? BorderRadius.only(topLeft: Radius.circular(16))
                : BorderRadius.only(topRight: Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment:
                widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                widget.message.message,
                textAlign: widget.isMe ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyNewMessage extends StatefulWidget {
  final String senderId;
  final String recipientId;
  const MyNewMessage({
    super.key,
    required this.senderId,
    required this.recipientId,
  });

  @override
  State<MyNewMessage> createState() => _MyNewMessageState();
}

class _MyNewMessageState extends State<MyNewMessage> {
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  String message = '';
  final chats = Get.put(ChatRepository());

  getMessages() async {
    FocusScope.of(context).unfocus();
    await ChatRepository.instance
        .addMessageToChat(widget.senderId, widget.recipientId, message);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                label: Text('Type your message'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                  gapPadding: 10.0,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              },
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              message.trim().isEmpty ? null : getMessages();
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Styles.c9,
              ),
              child: Icon(
                Icons.send_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
