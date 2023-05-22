import 'package:android_testing/components/constants.dart';
import 'package:android_testing/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterUser {
  final _db = FirebaseFirestore.instance;

  //store user info to the database
  Future<void> storeUserData(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(
        () => print("Event added to the database, id: {${user.id}}"));

    Map<String, dynamic> data = user.toJson();

    print('DATA:\n$data');
  }
}

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //fetch all the data
  Future<UserModel> getUserDetails(String fullname) async {
    final snapshot = await _db
        .collection("Users")
        .where("FullName", isEqualTo: fullname)
        .get();
    final data = snapshot.docs.map((e) => UserModel.fromFirestore(e)).single;
    return data;
  }

  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final data = snapshot.docs.map((e) => UserModel.fromFirestore(e)).toList();
    return data;
  }
}
