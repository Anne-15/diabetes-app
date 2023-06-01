import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/constants.dart';
import '../../../../repository/chats_repository.dart';

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
    setState(() {
      message = '';
    });
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
              if (message.trim().isNotEmpty) {
                getMessages();
              }
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
