import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/usermodel.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //text field controllers to get data from the text fields
  final fullname = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final type = TextEditingController();

  final userRepo = Get.put(UserRepository());

  //call this function from design
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  void resetPassword(String emailAddress) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
    }
  }

  //get all the list of users
  Future<List<UserModel>> getAllUsers() async {
    return await userRepo.allUsers();
  }
}
