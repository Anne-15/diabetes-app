import 'package:android_testing/components/app_layout.dart';
import 'package:android_testing/components/constants.dart';
import 'package:android_testing/screens/doctors%20view/appointments/tabs.dart';
import 'package:flutter/material.dart';

import 'create_appointment.dart';
import 'upcoming_appointments.dart';

class DoctorAppointments extends StatelessWidget {
  const DoctorAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Appointments",
          style: Styles.headerStyle2,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Tabs(size: size),
              SizedBox(height: AppLayout.getHeight(15)),
              UpcomingDoctorAppointment(size: size),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAppointment(),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
