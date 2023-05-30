import 'package:android_testing/components/constants.dart';
import 'package:android_testing/models/messages.dart';
import 'package:android_testing/repository/chats_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/my_doctors.dart';

class SpecialistChats extends StatefulWidget {
  final MyDoctorsModel user;
  const SpecialistChats({super.key, required this.user});

  @override
  State<SpecialistChats> createState() => _SpecialistChatsState();
}

class _SpecialistChatsState extends State<SpecialistChats> {
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
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: MyMessage(
                          receiverId: widget.user.fullname,
                          senderId: userid,
                        ),
                      ),
                    ),
                    NewMessages(
                      receiverId: widget.user.fullname,
                      senderId: userid,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyMessage extends StatefulWidget {
  final String senderId;
  final String receiverId;
  const MyMessage(
      {super.key, required this.senderId, required this.receiverId});

  @override
  State<MyMessage> createState() => _MyMessageState();
}

class _MyMessageState extends State<MyMessage> {
  @override
  Widget build(BuildContext context) {
    final myChats = Get.put(ChatRepository());
    return StreamBuilder<List<Messages>>(
      stream: myChats.getMessagesForChat(widget.senderId, widget.receiverId),
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
                    return MessageWidget(
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

class MessageWidget extends StatefulWidget {
  final Messages message;
  final bool isMe;
  const MessageWidget({super.key, required this.message, required this.isMe});

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

class NewMessages extends StatefulWidget {
  final String senderId;
  final String receiverId;
  const NewMessages(
      {super.key, required this.senderId, required this.receiverId});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
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
        .addMessageToChat(widget.senderId, widget.receiverId, message);
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
