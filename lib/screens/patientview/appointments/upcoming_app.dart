import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:android_testing/screens/patientview/appointments/past_app.dart';
import 'package:flutter/material.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({
    super.key,
    required this.size,
  });

  // ignore: prefer_typing_uninitialized_variables
  final size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(20),
          horizontal: AppLayout.getHeight(15)),
      height: AppLayout.getHeight(250),
      width: size.width * .44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Styles.c2,
      ),
      // color: Styles.primaryContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dr. Agnes\nNairobi Hospital",
            style: Styles.headerStyle3,
          ),
          Text(
            "Description: Review of the previous checkup",
            style: Styles.headerStyle4,
          ),
          Text(
            "Time: 8:00 AM TO 9:00AM\nDuration: 1 hour",
            style: Styles.headerStyle4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                backgroundColor: Styles.c1,
                onPressed: (() {}),
                label: Text(
                  "Join",
                  style: Styles.headerStyle4.copyWith(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
