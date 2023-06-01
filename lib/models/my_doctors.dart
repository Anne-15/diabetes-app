import 'package:cloud_firestore/cloud_firestore.dart';

class MyDoctorsModel {
  final String fullname;
  final String email;
  final String hospital;
  final String department;
  final String? userEmail;

  const MyDoctorsModel({
    required this.fullname,
    required this.email,
    required this.hospital,
    required this.department,
    required this.userEmail,
  });

  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
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
      email: data["Email"],
      hospital: data["Hospital"],
      department: data["Department"],
      userEmail: data['userEmail'],
    );
  }
}
