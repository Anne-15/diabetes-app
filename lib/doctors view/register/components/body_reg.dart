import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../components/already_have_an_account.dart';
import '../../../components/app_layout.dart';
import '../../../components/constants.dart';
import '../../../components/rounded_input_filed.dart';
import '../../../components/rounded_password_field.dart';
import '../../login/logindoctor.dart';
import 'background_reg.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "DIPLO APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            "Specialist Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.01),
          SvgPicture.asset(
            'assets/icons/signup.svg',
            height: size.height * 0.24,
          ),
          SizedBox(height: size.height * 0.02),
          RoundedInputField(
            hintText: "Full Name",
            onChanged: (String value) {},
          ),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedInputField(
            hintText: "Hospital Name",
            onChanged: (value) {},
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
                onPressed: () {},
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.white),
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
                  builder: (context) {
                    return DoctorLoginView();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
