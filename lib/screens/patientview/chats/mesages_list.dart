import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

import '../../../models/messages.dart';
import '../../../repository/chats_repository.dart';

class MyMessages extends StatefulWidget {
  final String chatId;
  const MyMessages({super.key, required this.chatId});

  @override
  State<MyMessages> createState() => _MyMessagesState();
}

class _MyMessagesState extends State<MyMessages> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Messages>>(
      stream: ChatRepository.instance.getMessagesForChat(widget.chatId),
      builder: (context, snapshot) {
        final messages = snapshot.data!;
        return messages.isEmpty
            ? Text('Say hi...')
            : ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return MessagesWidget(
                    message: message,
                    isMe: message.senderId == widget.chatId,
                  );
                });
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
            radius: 16,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          constraints: BoxConstraints(maxWidth: 140),
          decoration: BoxDecoration(
            color: widget.isMe ? Styles.c6 : Styles.c2,
            borderRadius: widget.isMe
                ? BorderRadius.only(bottomRight: Radius.circular(16))
                : BorderRadius.only(bottomLeft: Radius.circular(16)),
          ),
          child: Column(
            crossAxisAlignment:
                widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                widget.message as String,
                textAlign: widget.isMe ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        )
      ],
    );
  }
}
