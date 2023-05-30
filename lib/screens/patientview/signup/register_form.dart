import 'package:android_testing/screens/patientview/signin/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../models/usermodel.dart';
import '../../../repository/authentication_repository.dart';
import '../../../repository/user_repository.dart';
import '../../../widgets/verify_user_email.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

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

  Future registerNewUser(String email, String password) async {
    Get.put(AuthenticationRepository());
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerUser = Get.put(UserRepository());
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
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
                  onPressed: () {},
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
                width: size.width * 0.6,
                height: AppLayout.getHeight(40.0),
                child: ClipRRect(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Styles.primaryColor),
                    ),
                    onPressed: () async {
                      // final userid = FirebaseAuth.instance.currentUser!;
                      final user = UserModel(
                        // uid: userid.uid,
                        fullname: fullname.text.trim(),
                        email: email.text.trim(),
                        password: password.text.trim(),
                        age: age.text.trim(),
                        gender: gender.text.trim(),
                        type: type.text.trim(),
                      );
                      await registerUser.storeUserData(user)
                      .then((value) => registerNewUser(
                              email.text.trim(), password.text.trim()))
                      .whenComplete(
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyUserEmail(),
                              ),
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
            SizedBox(height: size.height * 0.03),
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
        ),
      ),
    );
  }
}
