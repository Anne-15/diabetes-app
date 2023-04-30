import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  final Widget child;
  const BackgroundLogin({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          // color: Colors.black,
          ),
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [child],
      ),
    );
  }
}
