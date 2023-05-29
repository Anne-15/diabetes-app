import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/appointments.dart';
import '../models/calendar_event_info.dart';

class AppointmentsRepository extends GetxController {
  static AppointmentsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

//store data in firestore
  addAppointments(AppointmentsModel appointments) async {
    await _db
        .collection("Appointments")
        .add(appointments.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        // ignore: avoid_types_as_parameter_names, body_might_complete_normally_catch_error, non_constant_identifier_names
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

//fetch all the data
  Future<AppointmentsModel> getappointmentDetails(String title) async {
    final snapshot = await _db
        .collection("Appointments")
        .where("title", isEqualTo: title)
        .get();
    final data =
        snapshot.docs.map((e) => AppointmentsModel.fromFirestore(e)).single;
    return data;
  }

  Future<List<AppointmentsModel>> allAppointments() async {
    final snapshot = await _db.collection("Appointments").get();
    final data =
        snapshot.docs.map((e) => AppointmentsModel.fromFirestore(e)).toList();
    return data;
  }

  // Get logged user appointment list only
  Future<List<EventInfo>> getMyAppointments() async {
    final currentUserEmail = FirebaseAuth.instance.currentUser?.email;
    final snapshot = await FirebaseFirestore.instance
        .collection('Appointments')
        .where('email', isEqualTo: currentUserEmail)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final data =
          snapshot.docs.map((e) => EventInfo.fromFirestore(e)).toList();
      return data;
    } else {
      throw Exception("No Appointments found");
    }
  }
}


