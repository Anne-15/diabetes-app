import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String fullname;
  final String email;
  final String password;
  final String age;
  final String gender;
  final String type;

  const UserModel({
    this.uid,
    required this.fullname,
    required this.email,
    required this.password,
    required this.age,
    required this.gender,
    required this.type,
  });

  toJson() {
    return {
      "id": uid,
      "FullName": fullname,
      "Email": email,
      "Password": password,
      "Age": age,
      "Gender": gender,
      "Type": type
    };
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return UserModel(
      uid: data["id"],
      fullname: data["FullName"],
      email: data["Email"],
      password: data["Password"],
      age: data["Age"],
      gender: data["Gender"],
      type: data["Type"],
    );
  }
}
