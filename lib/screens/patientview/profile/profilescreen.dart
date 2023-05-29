import 'package:android_testing/components/constants.dart';
import 'package:android_testing/screens/patientview/profile/components/profilemenu.dart';
import 'package:android_testing/screens/patientview/profile/updateprofile.dart';
import 'package:android_testing/screens/welcomescreen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/usermodel.dart';
import '../../../repository/user_repository.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final users = Get.put(UserRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
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
                        Icons.edit,
                        color: Styles.c12,
                        size: 20.0,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<UserModel>(
                future: users.getUserDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final UserModel userData = snapshot.data!;
                      return Column(
                        children: [
                          Text(userData.fullname, style: Styles.headerStyle2),
                          SizedBox(height: 5),
                          Text(userData.email, style: Styles.headerStyle3),
                        ],
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
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfile(),
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
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              //menu
              ProfileMenu(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {},
              ),
              ProfileMenu(
                  title: "User Managements", icon: Icons.check, onPress: () {}),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.1),
              ),
              SizedBox(
                height: 20,
              ),
              ProfileMenu(
                title: "About Us",
                icon: Icons.info_outline,
                onPress: () {},
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.c1,
                  ),
                  child: Text(
                    "Log out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
