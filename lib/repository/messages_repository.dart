import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MessageRepository extends GetxController {
  static MessageRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance; 
}
