import 'package:android_testing/models/doctormodel.dart';
import 'package:android_testing/screens/doctors%20view/appointments/appointments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../repository/doctor_user_repository.dart';

class ContactPatient extends StatelessWidget {
  const ContactPatient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final doctors = Get.put(DoctorUserRepository());
    return Container(
      height: AppLayout.getHeight(160),
      decoration: BoxDecoration(
        color: Styles.c6.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20.0),
      child: FutureBuilder(
        future: doctors.getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final DoctorUserModel userData = snapshot.data!;
              return Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        color: Styles.c1,
                      ),
                      SizedBox(width: AppLayout.getHeight(30)),
                      Text(userData.fullname),
                    ],
                  ),
                  SizedBox(height: AppLayout.getHeight(20)),
                  Row(
                    children: [
                      Icon(
                        Icons.local_hospital_outlined,
                        color: Styles.c1,
                      ),
                      SizedBox(width: AppLayout.getHeight(30)),
                      Text(userData.hospitalName),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorAppointments(),
                          ),
                        );
                      },
                      child: Text(
                        "Scheduled appointments",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Text("Nothing to show...");
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
