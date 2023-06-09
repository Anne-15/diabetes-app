import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';
import '../../../repository/chats_repository.dart';

class NewMessage extends StatefulWidget {
  final String senderId;
  final String receipientId;
  const NewMessage({
    super.key,
    required this.senderId,
    required this.receipientId,
  });

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  // final _controller = TextEditingController();
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  String message = '';
  final chats = Get.put(ChatRepository());

  getMessages() async {
    FocusScope.of(context).unfocus();
    await ChatRepository.instance
        .addMessageToChat(widget.senderId, widget.receipientId, message);
    setState(() {
      message = '';
    });
    _controller.clear();
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
              controller: _controller,
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
