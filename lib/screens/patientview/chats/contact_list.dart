import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          sliver:
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return Container();
          })),
        )
      ],
    );
  }
}
