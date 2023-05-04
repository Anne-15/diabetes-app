import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/appointments.dart';
import '../repository/appointment_repository.dart';

class AppointmentsController extends GetxController {
  static AppointmentsController get instance => Get.find();

  // final _db = FirebaseFirestore.instance;

  //text field controllers to get data from the text fields
  final title = TextEditingController();
  final notes = TextEditingController();

  final appointmentRepo = Get.put(AppointmentsRepository());

  void addAppointments(AppointmentsModel appointments) async {
    await appointmentRepo.addAppointments(appointments);
    // Get.to(() => '/navbar');
  }
}
