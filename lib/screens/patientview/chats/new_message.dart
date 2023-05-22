import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../repository/chats_repository.dart';

class NewMessage extends StatefulWidget {
  final String senderId;
  const NewMessage({
    super.key,
    required this.senderId,
  });

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  String message = '';

  getMessages() async {
    FocusScope.of(context).unfocus();
    await ChatRepository.instance.addMessageToChat(widget.senderId, message);
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
                  borderRadius: BorderRadius.circular(10.0),
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
                color: Styles.c1,
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