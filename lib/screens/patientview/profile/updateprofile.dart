import 'package:android_testing/screens/patientview/profile/profilescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyProfile();
                },
              ),
            );
          },
          icon: Icon(Icons.chevron_left_outlined),
        ),
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                  child: TextField(
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                  child: TextField(
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                  child: TextField(
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Diabetes Type",
                        icon: Icon(
                          Icons.notes_outlined,
                          color: Styles.primaryColor,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UpdateProfile();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Styles.c6),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
