import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../components/constants.dart';
import 'add_doctor_details.dart';

class MyDoctors extends StatelessWidget {
  const MyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Doctors",
          style: Styles.headerStyle2,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My doctor's details",
                style: Styles.headerStyle2,
              ),
              SizedBox(height: 5,),
              Text(
                "Get in touch with your specialist",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 30.0),
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDoctorDetails(),
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
