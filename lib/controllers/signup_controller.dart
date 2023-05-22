import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void signIn(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
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
}
