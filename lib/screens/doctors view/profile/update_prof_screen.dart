import 'package:android_testing/models/doctormodel.dart';
import 'package:android_testing/repository/doctor_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';

class DoctorUpdateProfile extends StatefulWidget {
  const DoctorUpdateProfile({super.key});

  @override
  State<DoctorUpdateProfile> createState() => _DoctorUpdateProfileState();
}

class _DoctorUpdateProfileState extends State<DoctorUpdateProfile> {
  final doctors = Get.put(DoctorUserRepository());
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    hospitalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: Styles.headerStyle2,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(30.0),
        child: FutureBuilder(
            future: doctors.getUserDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final DoctorUserModel userData = snapshot.data!;
                  fullnameController.text = userData.fullname;
                  emailController.text = userData.email;
                  passwordController.text = userData.password;
                  hospitalController.text = userData.hospitalName;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/images/profile.png"),
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
                                Icons.camera_alt_outlined,
                                color: Styles.c12,
                                size: 20.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Form(
                          child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            width: size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Styles.c12,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: Offset(0, 4))
                                ]),
                            child: TextFormField(
                              controller: fullnameController,
                              decoration: InputDecoration(
                                  hintText: "Full Name",
                                  icon: Icon(
                                    Icons.person_2_outlined,
                                    color: Styles.primaryColor,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            width: size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Styles.c12,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: Offset(0, 4))
                                ]),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(
                                    Icons.mail_outline_outlined,
                                    color: Styles.primaryColor,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            width: size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Styles.c12,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: Offset(0, 4))
                                ]),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(
                                    Icons.fingerprint_outlined,
                                    color: Styles.primaryColor,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            width: size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Styles.c12,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: Offset(0, 4))
                                ]),
                            child: TextFormField(
                              controller: hospitalController,
                              decoration: InputDecoration(
                                  hintText: "Hospital Name",
                                  icon: Icon(
                                    Icons.health_and_safety,
                                    color: Styles.primaryColor,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Styles.c6),
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Text('Nothing to show here...');
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      )),
    );
  }
}
