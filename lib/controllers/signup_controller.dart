import 'dart:js';

import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/repository/user_repository.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // final _db = FirebaseFirestore.instance;

  //text field controllers to get data from the text fields
  final fullname = TextEditingController();
  final email = TextEditingController();
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

  void createUser(BuildContext context, UserModel user) async {
    await userRepo.createUser(user);
    //authentication goes here also
    //then go to otp screen
    await Get.to((context) => BottomBar());
  }
}
