import 'package:android_testing/repository/doctor_user_repository.dart';
import 'package:android_testing/screens/doctors%20view/login/logindoctor.dart';
import 'package:android_testing/widgets/navigationbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../models/doctormodel.dart';
import '../../../repository/authentication_repository.dart';

class RegisterDoctorForm extends StatefulWidget {
  const RegisterDoctorForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<RegisterDoctorForm> createState() => _RegisterDoctorFormState();
}

class _RegisterDoctorFormState extends State<RegisterDoctorForm> {
  late TextEditingController fullname;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController hospitalname;

  @override
  void initState() {
    // TODO: implement initState
    fullname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    hospitalname = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullname.dispose();
    email.dispose();
    password.dispose();
    hospitalname.dispose();
    super.dispose();
  }

  void registerDoctor(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(
        GetSnackBar(
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerDoctorUser = DoctorUserRepository();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    value != null && !EmailValidator.validate(value)
                        ? 'Enter a valid email'
                        : null,
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
                controller: hospitalname,
                decoration: InputDecoration(
                  label: Text("Hospital Name"),
                  prefixIcon: Icon(
                    Icons.health_and_safety,
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
                        final doctors = DoctorUserModel(
                          fullname: fullname.text.trim(),
                          email: email.text.trim(),
                          password: password.text.trim(),
                          hospitalName: hospitalname.text.trim(),
                        );
                        final userId = FirebaseAuth.instance.currentUser!.uid;
                        await registerDoctorUser.createDoctorUser(
                            userId, doctors);

                        //register with email and password
                        registerDoctor(
                          email.text.trim(),
                          password.text.trim(),
                        );
                        // ignore: use_build_context_synchronously
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorNavBar(),
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
              SizedBox(height: widget.size.height * 0.03),
              AlreadyHaveAnAccount(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorLoginView(),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
