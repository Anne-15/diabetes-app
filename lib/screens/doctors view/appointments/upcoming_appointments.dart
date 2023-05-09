import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:android_testing/screens/doctors%20view/appointments/join_call.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: AppLayout.getHeight(20),
            horizontal: AppLayout.getHeight(15)),
        height: AppLayout.getHeight(215),
        // width: size.width * .44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Styles.c2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dr. Agnes,\nNairobi Hospital",
              style: Styles.headerStyle2,
            ),
            SizedBox(height: AppLayout.getHeight(5)),
            Text(
              "Description: Review of the previous checkup",
              style: Styles.headerStyle4,
            ),
            SizedBox(height: AppLayout.getHeight(5)),
            Text(
              "Time: 8:00 AM TO 9:00AM",
              style: Styles.headerStyle4,
            ),
            SizedBox(height: AppLayout.getHeight(5)),
            Text(
              "Duration: 1 hour",
              style: Styles.headerStyle4,
            ),
            SizedBox(height: AppLayout.getHeight(5)),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  // _handleCameraandMic(Permission.camera);
                  // _handleCameraandMic(Permission.microphone);
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => JoinVideoCall(),
                  //   ),
                  // );
                },
                child: Text(
                  "Join call",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}

// void _handleCameraandMic(Permission permission) {
//   final status = permission.request();
//   print(status);
// }
