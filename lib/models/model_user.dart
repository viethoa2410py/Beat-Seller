class UserModel {
  UserModel(
      {required this.id,
      required this.email,
      required this.role,
      required this.displayName});

  late String id;
  late String email;
  late String displayName;
  late String role;
  UserModel.fromJson(json) {
    id = json['uid'];
    displayName = json['displayName'] ?? "Display Name";
    email = json['email'];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.id;
    data['email'] = this.email;
    data['displayName'] = this.displayName;
    data['role'] = this.role;
    return data;
  }
}
