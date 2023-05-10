import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../components/constants.dart';

class IndividualChat extends StatelessWidget {
  const IndividualChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.c6,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            iconSize: 30,
            color: Colors.white,
          ),
        ],
        backgroundColor: Styles.c6,
        title: Text(
          "Contact Name",
          style: Styles.headerStyle2,
        ),
        // centerTitle: true,
      ),
      body: Column(
        
      ),
    );
  }
}