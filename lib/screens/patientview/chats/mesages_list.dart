import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/messages.dart';
import '../../../repository/chats_repository.dart';

class MyMessages extends StatefulWidget {
  final String senderId;
  final String recipientId;
  const MyMessages(
      {super.key, required this.senderId, required this.recipientId});

  @override
  State<MyMessages> createState() => _MyMessagesState();
}

class _MyMessagesState extends State<MyMessages> {
  final myChats = Get.put(ChatRepository());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Messages>>(
      stream: myChats.getMessagesForChat(widget.senderId, widget.recipientId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircleAvatar(),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
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
                    return MessagesWidget(
                      message: message,
                      isMe: message.senderId == widget.senderId,
                    );
                  },
                );
        }
      },
    );
  }
}

class MessagesWidget extends StatefulWidget {
  final Messages message;
  final bool isMe;
  const MessagesWidget({super.key, required this.message, required this.isMe});

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
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
                ? BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(16))
                : BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
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
        )
      ],
    );
  }
}
