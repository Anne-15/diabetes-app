import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../controllers/get_doctors_controllers.dart';
import '../../../models/doctormodel.dart';

class RegisterDoctorForm extends StatelessWidget {
  const RegisterDoctorForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorSignupController());
    // ignore: no_leading_underscores_for_local_identifiers
    final _signupkey = GlobalKey();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
          key: _signupkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullname,
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
                controller: controller.email,
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
                controller: controller.password,
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
                controller: controller.hosptialName,
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
                  width: size.width * 0.6,
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
                          fullname: controller.fullname.text.trim(),
                          email: controller.email.text.trim(),
                          password: controller.password.text.trim(),
                          hospitalName: controller.hosptialName.text.trim(),
                        );

                        DoctorSignupController.instance
                            .createDoctorUser(doctors);

                        //email and password authentication
                        DoctorSignupController.instance.registerDoctorUser(
                          controller.email.text.trim(),
                          controller.password.text.trim(),
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
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccount(
                login: false,
                press: () => context.go('/doctor_login'),
              ),
            ],
          )),
    );
  }
}
