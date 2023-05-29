import 'package:android_testing/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/constants.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  //add details to the database
  Future storeUserData(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            "Your account has been created successfully.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Styles.c10.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        // ignore: avoid_types_as_parameter_names, body_might_complete_normally_catch_error, non_constant_identifier_names
        .catchError((error, StackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }

  //fetch all the data
  Future<UserModel> getUserDetails() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final email = currentUser?.email;
    if (email != null) {
      final snapshot =
          await _db.collection("Users").where("Email", isEqualTo: email).get();
      if (snapshot.docs.isNotEmpty) {
        final data =
            snapshot.docs.map((e) => UserModel.fromFirestore(e)).single;
        return data;
      } else {
        throw Exception('User data not found');
      }
    } else {
      throw Exception('No logged user found');
    }
  }

  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final data = snapshot.docs.map((e) => UserModel.fromFirestore(e)).toList();
    return data;
  }
}
