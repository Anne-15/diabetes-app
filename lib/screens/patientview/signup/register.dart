import 'package:android_testing/models/usermodel.dart';
import 'package:android_testing/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';

class PatientRegister extends StatelessWidget {
  const PatientRegister({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/icons/login.svg',
                height: size.height * 0.2,
              ),
              Text(
                "Diplo App",
                style: Styles.headerStyle1,
              ),
              Text(
                "Welcome to the app, enjoy your experience!",
                style: Styles.headerStyle3,
              ),
              //register form
              SignUpForm(size: size)
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
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
                controller: controller.age,
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
                controller: controller.gender,
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
                controller: controller.type,
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
                      onPressed: () {
                        final user = UserModel(
                          fullname: controller.fullname.text.trim(),
                          email: controller.email.text.trim(),
                          password: controller.password.text.trim(),
                          age: controller.age.text.trim(),
                          gender: controller.gender.text.trim(),
                          type: controller.type.text.trim(),
                        );

                        SignupController.instance.createUser(user);

                        // context.go('/navbar');
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
                press: () => context.go('/login'),
              ),
            ],
          )),
    );
  }
}
