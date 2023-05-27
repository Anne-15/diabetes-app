import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorUserModel {
  final String? id;
  final String fullname;
  final String email;
  final String password;
  final String hospitalName;

  const DoctorUserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.hospitalName,
  });

  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Password": password,
      "HospitalName": hospitalName,
    };
  }

  factory DoctorUserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return DoctorUserModel(
      id: snapshot.id,
      fullname: data["FullName"],
      email: data["Email"],
      password: data["Password"],
      hospitalName: data["HospitalName"],
    );
  }
}
