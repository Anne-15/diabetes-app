import 'package:android_testing/components/constants.dart';
import 'package:android_testing/repository/authentication_repository.dart';
import 'package:android_testing/screens/doctors%20view/profile/update_prof_screen.dart';
import 'package:android_testing/screens/patientview/profile/components/profilemenu.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
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
              Text("Name"),
              Text("Email"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DoctorUpdateProfile();
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
                  title: "About Us", icon: Icons.info_outline, onPress: () {}),
              ProfileMenu(
                title: "Logout",
                icon: Icons.logout_rounded,
                endIcon: false,
                // textColor: Styles.c9,
                onPress: () {
                  AuthenticationRepository.instance.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
