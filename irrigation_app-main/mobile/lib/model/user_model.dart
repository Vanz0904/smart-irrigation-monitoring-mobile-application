// ignore_for_file: non_constant_identifier_names

class UserInfo {
  String ID;
  String Username;
  String Password;
  String Role;

  UserInfo(
      {required this.ID,
      required this.Username,
      required this.Password,
      required this.Role});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        ID: json["ID"],
        Username: json["Username"],
        Password: json["Password"],
        Role: json["Role"],
      );

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "Username": Username,
        "Password": Password,
        "Role": Role,
      };
}
