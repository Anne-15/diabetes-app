class UserModel {
  final String fullname;
  final String email;
  final String password;
  final String age;
  final String gender;
  final String type;

  const UserModel(
      {required this.fullname,
      required this.email,
      required this.password,
      required this.age,
      required this.gender,
      required this.type});

  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Password": password,
      "Age": age,
      "Gender": gender,
      "Type": type
    };
  }
}
