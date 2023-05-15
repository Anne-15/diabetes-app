import 'package:android_testing/screens/patientview/appointments/appointments.dart';
import 'package:flutter/material.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';

class MyDoctor extends StatelessWidget {
  const MyDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(160),
      decoration: BoxDecoration(
        color: Styles.c6.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person_2_rounded,
                color: Styles.c1,
              ),
              SizedBox(width: AppLayout.getHeight(30)),
              Text("Dr. Agnes"),
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
              Text("Nairobi, Hospital"),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAppointments()));
              },
              child: Text(
                "view scheduled appointments",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
