import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../models/my_doctors.dart';
import '../../../repository/my_doctors_repository.dart';
import 'add_doctor_details.dart';

class MyDoctors extends StatelessWidget {
  const MyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorRepo = Get.put(MyDoctorsRepository());

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
              SizedBox(
                height: 5,
              ),
              Text(
                "Get in touch with your specialist",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 30.0),
              FutureBuilder<List<MyDoctorsModel>>(
                future: doctorRepo.allMyDoctors(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (i, index) {
                          return Container(
                            height: AppLayout.getHeight(120),
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
                                    Text(snapshot.data![index].fullname),
                                  ],
                                ),
                                SizedBox(height: AppLayout.getHeight(5)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_hospital_outlined,
                                      color: Styles.c1,
                                    ),
                                    SizedBox(width: AppLayout.getHeight(30)),
                                    Text(snapshot.data![index].hospital),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return Center(
                        child: Text("Nothing to show"),
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              SizedBox(height: AppLayout.getHeight(30)),
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
