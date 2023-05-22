import 'package:flutter/material.dart';

class HistoryAppointments extends StatelessWidget {
  const HistoryAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            children: [
              Expanded(
                child: Card(
                  child: SizedBox.expand(),
                ),
              ),
              Divider(),
              Expanded(
                  child: Card(
                child: SizedBox.expand(),
              ))
            ],
          )
        ],
      ),
    );
  }
}
