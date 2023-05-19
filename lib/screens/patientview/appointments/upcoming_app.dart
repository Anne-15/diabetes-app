import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:android_testing/models/calendar_crud.dart';
import 'package:android_testing/screens/patientview/appointments/past_app.dart';
import 'package:flutter/material.dart';

class UpcomingAppointment extends StatefulWidget {
  const UpcomingAppointment({
    super.key,
    required this.size,
  });

  // ignore: prefer_typing_uninitialized_variables
  final size;

  @override
  State<UpcomingAppointment> createState() => _UpcomingAppointmentState();
}

class _UpcomingAppointmentState extends State<UpcomingAppointment> {
  Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.white,
      child: StreamBuilder(
        stream: storage.retrieveEvents(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            
          }
        },
      ),
    );
  }
}
