import 'package:android_testing/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class CreateAppointment extends StatefulWidget {
  const CreateAppointment({super.key});

  @override
  State<CreateAppointment> createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeControllerFrom = TextEditingController();
  TextEditingController _timeControllerTo = TextEditingController();

  DateTime _selectedDate = DateTime.now();

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

  Future<void> _selectTimeFrom(BuildContext context) async {
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

  Future<void> _selectTimeTo(BuildContext context) async {
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
                // controller: controller.title,
                decoration: InputDecoration(
                  label: Text("Add title"),
                  border: InputBorder.none,
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
                onTap: () => _selectTimeFrom(context),
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
                onTap: () => _selectTimeTo(context),
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
                // controller: controller.body,
                maxLines: null,
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
                decoration: InputDecoration(
                  label: Text("Additional notes"),
                  border: InputBorder.none,
                  icon: Icon(Icons.notes_outlined, color: Styles.c1),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FloatingActionButton.extended(
              onPressed: (() {
                // final article = ArticlesModel(
                //   title: controller.title.text.trim(),
                //   date: controller.date.text.trim(),
                //   body: controller.body.text.trim(),
                // );
                // ArticlesController.instance.addArticles(article);
              }),
              label: Text(
                "Send",
                style: Styles.headerStyle4,
              ),
              icon: Icon(
                Icons.send_rounded,
                color: Styles.c1,
              ),
            )
          ],
        ),
      )),
    );
  }
}
