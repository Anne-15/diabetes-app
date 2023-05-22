import 'dart:math';

import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../../../models/calendar_client.dart';
import '../../../repository/calendar_crud.dart';
import '../../../models/calendar_event_info.dart';

class CreateAppointment extends StatefulWidget {
  const CreateAppointment({super.key});

  @override
  State<CreateAppointment> createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {
  Storage storage = Storage();
  CalendarClient calendarClient = CalendarClient();

  late TextEditingController _dateController;
  late TextEditingController _timeControllerFrom;
  late TextEditingController _timeControllerTo;
  late TextEditingController _Title;
  late TextEditingController _Desc;
  late TextEditingController _Location;
  late TextEditingController _Attendee;

  late FocusNode textFocusNodeTitle;
  late FocusNode textFocusNodeDesc;
  late FocusNode textFocusNodeLocation;
  late FocusNode textFocusNodeAttendee;

  @override
  void initState() {
    // TODO: implement initState
    _dateController = TextEditingController();
    _timeControllerFrom = TextEditingController();
    _timeControllerTo = TextEditingController();
    _Title = TextEditingController();
    _Desc = TextEditingController();
    _Location = TextEditingController();
    _Attendee = TextEditingController();

    textFocusNodeTitle = FocusNode();
    textFocusNodeDesc = FocusNode();
    textFocusNodeLocation = FocusNode();
    textFocusNodeAttendee = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _dateController.dispose();
    _timeControllerFrom.dispose();
    _timeControllerTo.dispose();
    _Title.dispose();
    _Desc.dispose();
    _Location.dispose();
    _Attendee.dispose();
    textFocusNodeTitle.dispose();
    textFocusNodeDesc.dispose();
    textFocusNodeLocation.dispose();
    textFocusNodeAttendee.dispose();

    super.dispose();
  }

  DateTime _selectedDate = DateTime.now();

  bool isEditingDate = false;
  bool isEditingStartTime = false;
  bool isEditingEndTime = false;
  bool isEditingBatch = false;
  bool isEditingTitle = false;
  bool isEditingEmail = false;
  bool isEditingLink = false;
  bool isErrorTime = false;
  bool shouldNofityAttendees = false;
  bool hasConferenceSupport = false;

  bool isDataStorageInProgress = false;

  late String currentTitle;
  late String currentDesc;
  late String currentLocation;
  late String currentEmail;

  String errorString = '';

//date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(_selectedDate);
      });
    }
  }

  //time picker
  TimeOfDay? _selectedTimeFrom;

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTimeFrom = picked;
        _timeControllerFrom.text = _selectedTimeFrom!.format(context);
      });
    }
  }

  //time picker
  TimeOfDay? _selectedTimeTo;

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTimeTo = picked;
        _timeControllerTo.text = _selectedTimeTo!.format(context);
      });
    }
  }

  String? validateTitle(String value) {
    // ignore: unnecessary_null_comparison
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return 'Title can\'t be empty';
      }
    } else {
      return 'Title can\'t be empty';
    }

    return null;
  }

  String? validateEmail(String value) {
    // ignore: unnecessary_null_comparison
    if (value != null) {
      value = value.trim();

      if (value.isEmpty) {
        return 'Can\'t add an empty email';
      } else {
        final regex = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
        final matches = regex.allMatches(value);
        for (Match match in matches) {
          if (match.start == 0 && match.end == value.length) {
            return null;
          }
        }
      }
    } else {
      return 'Can\'t add an empty email';
    }

    return 'Invalid email';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Schedule Appointment",
          style: Styles.headerStyle2,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            // SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: TextField(
                controller: _Title,
                onChanged: (value) {
                  setState(() {
                    isEditingTitle = true;
                    currentTitle = value;
                  });
                },
                onSubmitted: (value) {
                  textFocusNodeTitle.unfocus();
                  // FocusScope.of(context).requestFocus(textFocusNodeDesc);
                },
                decoration: InputDecoration(
                  label: Text("Add title"),
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.title_rounded,
                    color: Styles.c1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              // width: 12.0,
              // height: 12.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: TextField(
                controller: _dateController,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  label: Text("Date"),
                  border: InputBorder.none,
                  icon: Icon(Icons.calendar_month_outlined, color: Styles.c1),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: TextField(
                controller: _timeControllerFrom,
                onTap: () => _selectStartTime(context),
                decoration: InputDecoration(
                  label: Text("Time from: "),
                  border: InputBorder.none,
                  icon: Icon(Icons.timelapse_outlined, color: Styles.c1),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: TextField(
                controller: _timeControllerTo,
                onTap: () => _selectEndTime(context),
                decoration: InputDecoration(
                  label: Text("Time to: "),
                  border: InputBorder.none,
                  icon: Icon(Icons.timelapse_outlined, color: Styles.c1),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: TextField(
                controller: _Attendee,
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    currentEmail = value;
                  });
                },
                onSubmitted: (value) {
                  textFocusNodeAttendee.unfocus();
                },
                decoration: InputDecoration(
                  label: Text("Add people"),
                  border: InputBorder.none,
                  icon: Icon(Icons.people_alt_outlined, color: Styles.c1),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: TextField(
                controller: _Desc,
                onChanged: (value) {
                  setState(() {
                    currentDesc = value;
                  });
                },
                onSubmitted: (value) {
                  textFocusNodeDesc.unfocus();
                },
                decoration: InputDecoration(
                  label: Text("Additional notes"),
                  border: InputBorder.none,
                  icon: Icon(Icons.notes_outlined, color: Styles.c1),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: TextField(
                controller: _Location,
                onChanged: (value) {
                  setState(() {
                    currentLocation = value;
                  });
                },
                onSubmitted: (value) {
                  textFocusNodeLocation.unfocus();
                },
                decoration: InputDecoration(
                  label: Text("Location"),
                  border: InputBorder.none,
                  icon: Icon(Icons.location_city_outlined, color: Styles.c1),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add video conferencing',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                Switch(
                  value: hasConferenceSupport,
                  onChanged: (value) {
                    setState(() {
                      hasConferenceSupport = value;
                    });
                  },
                  activeColor: Styles.c1,
                )
              ],
            ),
            SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                onPressed: isDataStorageInProgress
                    ? null
                    : () async {
                        setState(() {
                          isErrorTime = false;
                          isDataStorageInProgress = true;
                        });

                        // ignore: unnecessary_null_comparison
                        if (_selectedDate != null &&
                            _selectedTimeFrom != null &&
                            _selectedTimeTo != null) {
                          int startTimeInEpoch = DateTime(
                            _selectedDate.year,
                            _selectedDate.month,
                            _selectedDate.day,
                            _selectedTimeFrom!.hour,
                            _selectedTimeFrom!.minute,
                          ).microsecondsSinceEpoch;

                          int endTimeInEpoch = DateTime(
                            _selectedDate.year,
                            _selectedDate.month,
                            _selectedDate.day,
                            _selectedTimeTo!.hour,
                            _selectedTimeTo!.minute,
                          ).microsecondsSinceEpoch;

                          print(
                              'DIFFERENCE: ${endTimeInEpoch - startTimeInEpoch}');

                          print(
                              'Start Time: ${DateTime.fromMillisecondsSinceEpoch(startTimeInEpoch)}');
                          print(
                              'End Time: ${DateTime.fromMillisecondsSinceEpoch(endTimeInEpoch)}');

                          String? eventId;
                          String? eventLink;

                          if (endTimeInEpoch - startTimeInEpoch > 0) {
                            await calendarClient
                                .insert(
                              title: currentTitle,
                              description: currentDesc,
                              location: currentLocation,
                              attendeeEmailList: currentEmail,
                              hasConferenceSupport: hasConferenceSupport,
                              startTime: DateTime.fromMillisecondsSinceEpoch(
                                  startTimeInEpoch),
                              endTime: DateTime.fromMillisecondsSinceEpoch(
                                  endTimeInEpoch),
                            )
                                .then((eventData) async {
                              eventId = eventData['id'];
                              eventLink = eventData['link'];

                              EventInfo eventInfo = EventInfo(
                                id: eventId ?? '',
                                name: currentTitle,
                                description: currentDesc,
                                location: currentLocation,
                                link: eventLink ?? '',
                                attendeeEmails: currentEmail,
                                hasConfereningSupport: hasConferenceSupport,
                                startTimeInEpoch: startTimeInEpoch,
                                endTimeInEpoch: endTimeInEpoch,
                              );

                              await storage
                                  .storeEventData(eventInfo)
                                  .whenComplete(
                                      () => Navigator.of(context).pop());
                              setState(() {
                                isDataStorageInProgress = false;
                              });
                            });
                          }
                        }
                      },
                label: Text(
                  "Save",
                  style: Styles.headerStyle4,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
