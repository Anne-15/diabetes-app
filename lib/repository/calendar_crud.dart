import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/calendar_event_info.dart';

final CollectionReference mainCollection =
    FirebaseFirestore.instance.collection('Appointments');
final DocumentReference documentReference = mainCollection.doc('Events');

final _db = FirebaseFirestore.instance;

class Storage {
  //store event data

  Future<void> storeEventData(EventInfo eventInfo) async {
    await _db.collection("Appointments").add(eventInfo.toJson()).whenComplete(
        () => print("Event added to the database, id: {${eventInfo.id}}"));

    Map<String, dynamic> data = eventInfo.toJson();

    print('DATA:\n$data');
  }

  Future<void> updateEventData(EventInfo eventInfo) async {
    DocumentReference documentReferencer =
        _db.collection('Appointments').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    print('DATA:\n$data');

    await documentReferencer.update(data).whenComplete(() {
      print("Event updated in the database, id: {${eventInfo.id}}");
    }).catchError((e) => print(e));
  }

  Future<void> deleteEvent({required String id}) async {
    DocumentReference documentReferencer =
        _db.collection('Appointments').doc(id);

    await documentReferencer.delete().catchError((e) => print(e));

    print('Event deleted, id: $id');
  }

  Stream<QuerySnapshot> retrieveEvents() {
    Stream<QuerySnapshot> myClasses = documentReference
        .collection('Appointments')
        .orderBy('start')
        .snapshots();

    return myClasses;
  }

  // Future<ArticlesModel> getLatestArticle() async {
  //   final snapshot = await _db
  //       .collection("Articles")
  //       .orderBy("date", descending: true)
  //       .limit(1)
  //       .get();

  //   if (snapshot.docs.isNotEmpty) {
  //     final data =
  //         snapshot.docs.map((e) => ArticlesModel.fromFirestore(e)).single;
  //     return data;
  //   } else {
  //     throw Exception("No articles found");
  //   }
  // }
}
