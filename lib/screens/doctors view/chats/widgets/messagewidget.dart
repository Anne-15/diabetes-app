import 'package:flutter/material.dart';

import '../../../../components/constants.dart';
import '../../../../models/messages.dart';

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
