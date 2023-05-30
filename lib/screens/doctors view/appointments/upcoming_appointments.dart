import 'package:android_testing/components/constants.dart';
import 'package:android_testing/repository/appointment_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/calendar_event_info.dart';
import '../../../repository/calendar_crud.dart';

class UpcomingDoctorAppointment extends StatefulWidget {
  const UpcomingDoctorAppointment({
    super.key,
    required this.size,
  });

  // ignore: prefer_typing_uninitialized_variables
  final size;

  @override
  State<UpcomingDoctorAppointment> createState() => _UpcomingDoctorAppointmentState();
}

class _UpcomingDoctorAppointmentState extends State<UpcomingDoctorAppointment> {
  Storage storage = Storage();
  final appointment = Get.put(AppointmentsRepository());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: storage.retrieveEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.docs.isNotEmpty) {
            return SizedBox(
              height: 580.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Object? eventInfo = snapshot.data!.docs[index].data();

                  EventInfo events = EventInfo.fromMap(eventInfo as Map);

                  DateTime startTime = DateTime.fromMicrosecondsSinceEpoch(
                      events.startTimeInEpoch);
                  DateTime endTime = DateTime.fromMillisecondsSinceEpoch(
                      events.endTimeInEpoch);

                  String startTimeString = DateFormat.jm().format(startTime);
                  String endTimeString = DateFormat.jm().format(endTime);
                  String dateString = DateFormat.yMMMMd().format(startTime);

                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              bottom: 16.0,
                              top: 16.0,
                              left: 16.0,
                              right: 16.0,
                            ),
                            decoration: BoxDecoration(
                              color: Styles.c2,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  events.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  events.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Text(
                                    'link: https://meet.google.com/wbi-rrso-ybc',
                                    style: TextStyle(
                                      color: Styles.c1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 5,
                                      color: Styles.c1,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dateString,
                                          style: TextStyle(
                                            // color: CustomColor.dark_cyan,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                        Text(
                                          '$startTimeString - $endTimeString',
                                          style: TextStyle(
                                            // color: CustomColor.dark_cyan,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(
                'No Appointments',
                style: TextStyle(
                  color: Colors.black38,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Styles.c1),
            ),
          );
        }
      },
    );
  }
}
