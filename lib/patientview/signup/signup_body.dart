import 'package:android_testing/firebase_options.dart';
import 'package:android_testing/patientview/signup/signup_background.dart';
import 'package:android_testing/widgets/bottomnav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/already_have_an_account.dart';
import '../../components/constants.dart';
import '../../components/rounded_input_filed.dart';
import '../../components/rounded_password_field.dart';
import '../../doctors view/register/registerdoctor.dart';
import '../home/homepage.dart';
import '../signin/signin.dart';

class BodyRegister extends StatefulWidget {
  final Widget child;
  const BodyRegister({super.key, required this.child});

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _age;
  late final TextEditingController _gender;
  late final TextEditingController _type;

  @override
  void initState() {
    // TODO: implement initState
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _age = TextEditingController();
    _gender = TextEditingController();
    _type = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _name.dispose();
    _email.dispose();
    _password.dispose();
    _age.dispose();
    _gender.dispose();
    _type.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundRegister(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DIPLO APP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.03,
                    fontFamily: 'Mali'),
              ),
              // Gap(AppLayout.getHeight(20)),
              SizedBox(height: size.height * 0.01),
              SvgPicture.asset(
                'assets/icons/signup.svg',
                height: size.height * 0.20,
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Styles.c4,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                      hintText: "Full Name",
                      icon: Icon(
                        Icons.person_2_rounded,
                        color: Styles.primaryColor,
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Styles.c4,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Your Email",
                      icon: Icon(
                        Icons.email_rounded,
                        color: Styles.primaryColor,
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Styles.c4,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                      color: Styles.primaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Styles.primaryColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Styles.c4,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Age",
                      icon: Icon(
                        Icons.person_2_rounded,
                        color: Styles.primaryColor,
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Styles.c4,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _gender,
                  decoration: InputDecoration(
                      hintText: "Gender",
                      icon: Icon(
                        Icons.person_2_rounded,
                        color: Styles.primaryColor,
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: Styles.c4,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _type,
                  decoration: InputDecoration(
                      hintText: "Diabetes Type",
                      icon: Icon(
                        Icons.person_2_rounded,
                        color: Styles.primaryColor,
                      ),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                width: size.width * 0.8,
                // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Styles.primaryColor),
                    ),
                    onPressed: () async {
                      final name = _name.text;
                      final email = _email.text;
                      final password = _password.text;
                      final age = _age.text;
                      final gender = _gender.text;
                      final type = _type.text;

                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                        print(userCredential);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          print("The password provided is weak");
                        } else if (e.code == "email-already-in-use") {
                          print("The account already exists for that email.");
                        }
                      } catch (e) {
                        print(e);
                      }

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BottomBar();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              AlreadyHaveAnAccount(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LogIn();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.01),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterDoctorPage();
                      },
                    ),
                  );
                },
                child: Text("Sign up as a specialist/doctor"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
