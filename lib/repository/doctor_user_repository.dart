import 'package:android_testing/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/doctormodel.dart';

class DoctorUserRepository extends GetxController {
  static DoctorUserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  //add details to the database
  createDoctorUser(String id, DoctorUserModel doctor) async {
    await _db
        .collection("Doctors")
        .doc(id)
        .set(doctor.toJson())
        .then((value) => print('User added to database'))
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
        },);
  }

  //fetch the data from the database
  Future<DoctorUserModel> getDoctorDetails(String fullname) async {
    final snapshot = await _db
        .collection("Doctors")
        .where("FullName", isEqualTo: fullname)
        .get();
    final data =
        snapshot.docs.map((e) => DoctorUserModel.fromFirestore(e)).single;
    return data;
  }

  Future<List<DoctorUserModel>> allDoctors() async {
    final snapshot = await _db.collection("Doctors").get();
    final data =
        snapshot.docs.map((e) => DoctorUserModel.fromFirestore(e)).toList();
    return data;
  }
}
