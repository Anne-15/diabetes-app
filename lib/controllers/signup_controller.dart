import 'package:android_testing/middleware/config.dart';
import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/repository/user_repository.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // final _db = FirebaseFirestore.instance;

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
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => Center(
    //           child: CircularProgressIndicator(),
    //         ));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      // Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
      // Navigator.of(context).pop();
    }
  }

  void createUser(UserModel user) async {
    //add user to the database
    await userRepo.createUser(user);
    //listen to already logged in user
    await ConfigDataStore.to.savedAlreadyOpen();
    //then go to otp screen
    await Get.toNamed('/navbar');
  }
}
