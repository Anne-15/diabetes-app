import 'package:android_testing/screens/patientview/signin/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../models/usermodel.dart';
import '../../../repository/authentication_repository.dart';
import '../../../repository/user_repository.dart';
import '../../../widgets/bottomnav.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController fullname;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController age;
  late TextEditingController gender;
  late TextEditingController type;

  @override
  void initState() {
    // TODO: implement initState
    fullname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    age = TextEditingController();
    gender = TextEditingController();
    type = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullname.dispose();
    email.dispose();
    age.dispose();
    gender.dispose();
    type.dispose();
    super.dispose();
  }

  void registerNewUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _signupkey = GlobalKey();
    RegisterUser registerUser = RegisterUser();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
          key: _signupkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                controller: email,
                decoration: InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: Styles.c1,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(
                    Icons.fingerprint_rounded,
                    color: Styles.c1,
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
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
                  width: widget.size.width * 0.6,
                  height: AppLayout.getHeight(40.0),
                  child: ClipRRect(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Styles.primaryColor),
                      ),
                      onPressed: () async {
                        //add data to the database
                        final user = UserModel(
                          fullname: fullname.text.trim(),
                          email: email.text.trim(),
                          password: password.text.trim(),
                          age: age.text.trim(),
                          gender: gender.text.trim(),
                          type: type.text.trim(),
                        );
                        final userId = FirebaseAuth.instance.currentUser!.uid;
                        await registerUser
                            .storeUserData(userId, user)
                            .then((user) => registerNewUser(
                                  email.text.trim(),
                                  password.text.trim(),
                                ))
                            .whenComplete(
                          () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomBar(),
                              ),
                            );
                          },
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
              SizedBox(height: widget.size.height * 0.03),
              AlreadyHaveAnAccount(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientLogin(),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
