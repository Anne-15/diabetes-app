import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'calendar_event_info.dart';

final CollectionReference mainCollection =
    FirebaseFirestore.instance.collection('Appointments');
final DocumentReference documentReference = mainCollection.doc('Events');

class Storage {
  Future<void> storeEventData(EventInfo eventInfo) async {
    DocumentReference documentReferencer =
        documentReference.collection('Appointments').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    print('DATA:\n$data');

    await documentReferencer.set(data).whenComplete(() {
      print("Event added to the database, id: {${eventInfo.id}}");
    }).catchError((e) => print(e));
  }

  Future<void> updateEventData(EventInfo eventInfo) async {
    DocumentReference documentReferencer =
        documentReference.collection('Appointments').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    print('DATA:\n$data');

    await documentReferencer.update(data).whenComplete(() {
      print("Event updated in the database, id: {${eventInfo.id}}");
    }).catchError((e) => print(e));
  }

  Future<void> deleteEvent({required String id}) async {
    DocumentReference documentReferencer =
        documentReference.collection('Appointments').doc(id);

    await documentReferencer.delete().catchError((e) => print(e));

    print('Event deleted, id: $id');
  }

  Stream<QuerySnapshot> retrieveEvents() {
    Stream<QuerySnapshot> myClasses =
        documentReference.collection('Appointments').orderBy('start').snapshots();

    return myClasses;
  }
}
