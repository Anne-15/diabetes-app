// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/constants.dart';
import '../../../models/usermodel.dart';
import '../../../repository/user_repository.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final users = Get.put(UserRepository());
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final users = Get.put(UserRepository());
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
            FutureBuilder<UserModel>(
              future: users.getUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final UserModel userData = snapshot.data!;
                    fullnameController.text = userData.fullname;
                    emailController.text = userData.email;
                    passwordController.text = userData.password;
                    typeController.text = userData.type;
                    return Builder(
                      builder: (context) {
                        return Column(
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
                                    hintText: 'Full name',
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
                                    hintText: 'Email',
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
                                    hintText: 'Password',
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
                                controller: typeController,
                                decoration: InputDecoration(
                                    hintText: 'Diabetes Type',
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
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Text('Nothing to show here...');
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
