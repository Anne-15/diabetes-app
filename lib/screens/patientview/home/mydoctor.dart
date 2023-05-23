import 'package:android_testing/models/my_doctors.dart';
import 'package:android_testing/repository/my_doctors_repository.dart';
import 'package:android_testing/screens/patientview/appointments/appointments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';

class MyDoctor extends StatelessWidget {
  const MyDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final doctorRepo = Get.put(MyDoctorsRepository());
    return Container(
      height: AppLayout.getHeight(160),
      decoration: BoxDecoration(
        color: Styles.c6.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20.0),
      child: FutureBuilder<MyDoctorsModel>(
        future: doctorRepo.getLatestDoctor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final doctor = snapshot.data!;
              return Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        color: Styles.c1,
                      ),
                      SizedBox(width: AppLayout.getHeight(30)),
                      Text(doctor.fullname),
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
                      Text(doctor.hospital),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAppointments()));
                      },
                      child: Text(
                        "view scheduled appointments",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text("Nothing to show for now"),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
