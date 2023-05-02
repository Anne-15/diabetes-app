import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {},
        ),
      ),
    );
  }
}
