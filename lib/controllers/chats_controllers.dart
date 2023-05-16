import 'package:android_testing/models/chats.dart';
import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/repository/chats_repository.dart';
import 'package:android_testing/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ChatPageController extends GetxController {
  static ChatPageController get instance => Get.find();

  final _chats = Get.put(ChatRepository());

  
}
