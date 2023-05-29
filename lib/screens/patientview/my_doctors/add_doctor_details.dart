import 'package:android_testing/models/my_doctors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../repository/my_doctors_repository.dart';

class AddDoctorDetails extends StatefulWidget {
  const AddDoctorDetails({super.key});

  @override
  State<AddDoctorDetails> createState() => _AddDoctorDetailsState();
}

class _AddDoctorDetailsState extends State<AddDoctorDetails> {
  late TextEditingController name;
  late TextEditingController hospital;
  late TextEditingController department;

  @override
  void initState() {
    // TODO: implement initState
    name = TextEditingController();
    hospital = TextEditingController();
    department = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    hospital.dispose();
    department.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

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
              SizedBox(height: 15.0),
              Text(
                "Add your specialist details to get in touch.",
                style: Styles.headerStyle4,
              ),
              SizedBox(height: 30.0),
              Stack(
                children: [
                  SizedBox(
                    // width: 300,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/nature.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Styles.c1,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Styles.c12,
                        size: 20.0,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    label: Text("Name"),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: TextField(
                  controller: hospital,
                  decoration: InputDecoration(
                    label: Text("Hospital"),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: TextField(
                  controller: department,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text("Department"),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton.extended(
                  onPressed: (() async {
                    final currentUser = FirebaseAuth.instance.currentUser!.email;
                    final myDoctor = MyDoctorsModel(
                      fullname: name.text.trim(),
                      hospital: hospital.text.trim(),
                      department: department.text.trim(),
                      userEmail: currentUser,
                    );

                    await MyDoctorsRepository.instance
                        .createDoctorUser(myDoctor);

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }),
                  label: Text(
                    "Save",
                    style: Styles.headerStyle4,
                  ),
                  icon: Icon(
                    Icons.send_rounded,
                    color: Styles.c1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
