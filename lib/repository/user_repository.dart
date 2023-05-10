import 'package:android_testing/components/constants.dart';
import 'package:android_testing/middleware/config.dart';
import 'package:android_testing/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    //store the data locally
    UserModel userProfile = UserModel(
      fullname: user.fullname,
      email: user.email,
      password: user.password,
      age: user.age,
      gender: user.gender,
      type: user.type,
    );
    ConfigDataStore.to.savedProfile(userProfile);

    //store the data in firebase
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created.",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Styles.c10.withOpacity(0.1),
              colorText: Colors.green),
        )
        // ignore: avoid_types_as_parameter_names, body_might_complete_normally_catch_error, non_constant_identifier_names
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

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
