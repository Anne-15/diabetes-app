import 'package:android_testing/models/messages.dart';
import 'package:android_testing/models/usermodel.dart';

class Chats {
  final String id;
  final String currentUserId;
  final bool activity;
  final List<UserModel> members;
  List<Messages> messages;

  late final List<UserModel> _receiver;

  Chats(
      {required this.id,
      required this.currentUserId,
      required this.activity,
      required this.members,
      required this.messages}) {
    _receiver =
        members.where((element) => element.uid != currentUserId).toList();
  }

  List<UserModel> receiver() {
    return _receiver;
  }

  String title() {
    return _receiver.first.fullname;
  }
}
