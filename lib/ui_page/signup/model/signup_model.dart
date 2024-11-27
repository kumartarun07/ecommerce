class SignUpModel {
  String name;
  String mobile_number;
  String email;
  String password;
  SignUpModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.mobile_number});

  factory SignUpModel.fromMap(Map<String, dynamic> map) => SignUpModel(
      name: map["name"],
      email: map["email"],
      password: map["password"],
      mobile_number: map["mobile_number"]);

  Map<String, dynamic> toMap() => {
        "name": name,
        "mobile_number": mobile_number,
        "email": email,
        "password": password
      };
}
