import 'package:cloud_firestore/cloud_firestore.dart';

class EventInfo {
  late final String? id;
  final String name;
  final String description;
  final String location;
  final String link;
  final String attendeeEmails;
  final bool hasConfereningSupport;
  final int startTimeInEpoch;
  final int endTimeInEpoch;

  EventInfo({
    this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.link,
    required this.attendeeEmails,
    required this.hasConfereningSupport,
    required this.startTimeInEpoch,
    required this.endTimeInEpoch,
  });

  EventInfo.fromMap(Map snapshot)
      : id = snapshot['id'],
        name = snapshot['name'] ?? '',
        description = snapshot['desc'],
        location = snapshot['loc'],
        link = snapshot['link'],
        attendeeEmails = snapshot['email'],
        hasConfereningSupport = snapshot['has_conferencing'],
        startTimeInEpoch = snapshot['start'],
        endTimeInEpoch = snapshot['end'];

  toJson() {
    return {
      'id': id,
      'name': name,
      'desc': description,
      'loc': location,
      'link': link,
      'email': attendeeEmails,
      'has_conferencing': hasConfereningSupport,
      'start': startTimeInEpoch,
      'end': endTimeInEpoch,
    };
  }

  factory EventInfo.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return EventInfo(
      id: data["id"],
      name: data["name"],
      description: data["desc"],
      location: data["loc"],
      link: data["link"],
      attendeeEmails: data["email"],
      hasConfereningSupport: data["has_conferencing"],
      startTimeInEpoch: data["start"],
      endTimeInEpoch: data["end"],
    );
  }
}
