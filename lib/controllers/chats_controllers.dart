import 'package:android_testing/repository/chats_repository.dart';
import 'package:get/get.dart';

class ChatPageController extends GetxController {
  static ChatPageController get instance => Get.find();

  final _chats = Get.put(ChatRepository());

  
}
