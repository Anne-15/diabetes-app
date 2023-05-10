import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/doctormodel.dart';
import '../repository/doctor_user_repository.dart';

class DoctorSignupController extends GetxController {
  static DoctorSignupController get instance => Get.find();

  //text field controllers to get data from the text fields
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final hosptialName = TextEditingController();

  final doctorRepo = Get.put(DoctorUserRepository());

  //call this function from design
  void registerDoctorUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  void createDoctorUser(DoctorUserModel doctor) async {
    //add details to the databaase
    await doctorRepo.createDoctorUser(doctor);
    //then go to the home screen
    await Get.toNamed('/doctor_navbar');
  }
}
