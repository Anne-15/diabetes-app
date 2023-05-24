import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/messages.dart';
import '../../../../repository/chats_repository.dart';
import 'messagewidget.dart';

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
