import 'package:cloud_firestore/cloud_firestore.dart';

class MyDoctorsModel {
  final String fullname;
  final String hospital;
  final String department;
  final String? userEmail;

  const MyDoctorsModel({
    required this.fullname,
    required this.hospital,
    required this.department,
    required this.userEmail,
  });

  toJson() {
    return {
      "FullName": fullname,
      "Hospital": hospital,
      "Department": department,
      "userEmail": userEmail,
    };
  }

  factory MyDoctorsModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return MyDoctorsModel(
      fullname: data["FullName"],
      hospital: data["Hospital"],
      department: data["Department"],
      userEmail: data['userEmail'],
    );
  }
}
