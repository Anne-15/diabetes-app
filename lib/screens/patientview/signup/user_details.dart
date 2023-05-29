import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../models/usermodel.dart';
import '../../../repository/user_repository.dart';
import '../../../widgets/bottomnav.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key, required this.email, required this.password});

  final String email;
  final String password;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late TextEditingController fullname;
  late TextEditingController age;
  late TextEditingController gender;
  late TextEditingController type;

  @override
  void initState() {
    // TODO: implement initState
    fullname = TextEditingController();
    age = TextEditingController();
    gender = TextEditingController();
    type = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullname.dispose();
    age.dispose();
    gender.dispose();
    type.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerUser = Get.put(UserRepository());
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            TextFormField(
              controller: fullname,
              decoration: InputDecoration(
                label: Text("Full Name"),
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  color: Styles.c1,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: age,
              decoration: InputDecoration(
                label: Text("Age"),
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  color: Styles.c1,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: gender,
              decoration: InputDecoration(
                label: Text("Gender"),
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  color: Styles.c1,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: type,
              decoration: InputDecoration(
                label: Text("Diabetes Type"),
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  color: Styles.c1,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30.0),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: size.width * 0.6,
                height: AppLayout.getHeight(40.0),
                child: ClipRRect(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Styles.primaryColor),
                    ),
                    onPressed: () async {
                      final userid = FirebaseAuth.instance.currentUser;
                      //add data to the database
                      final user = UserModel(
                        uid: userid!.uid,
                        fullname: fullname.text.trim(),
                        email: widget.email,
                        password: widget.password,
                        age: age.text.trim(),
                        gender: gender.text.trim(),
                        type: type.text.trim(),
                      );
                      await registerUser.storeUserData(user);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomBar(),
                        ),
                      );
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
