import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';

import '../../middleware/auth.dart';
import '../doctors view/login/logindoctor.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage("assets/images/welcome.png"),
              height: size.height * 0.6,
            ),
            Column(
              children: [
                Text(
                  "Welcome",
                  style: Styles.header1,
                ),
                Text(
                  "Get started with the app experience, but first identify which user you are...",
                  style: Styles.headerStyle4,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthPage(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: Styles.c1,
                      side: BorderSide(color: Colors.black),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: Text("Patient".toUpperCase()),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorLoginView(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: Styles.c12,
                      backgroundColor: Styles.c1,
                      // side: BorderSide(color: Colors.white),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: Text("Doctor".toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
