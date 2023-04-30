import 'package:flutter/material.dart';

class BackgroundRegister extends StatelessWidget {
  final Widget child;
  const BackgroundRegister({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [child],
        ),
      ),
    );
  }
}
