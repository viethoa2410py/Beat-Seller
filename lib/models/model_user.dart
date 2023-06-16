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
  String? avatar;
  UserModel.fromJson(json) {
    id = json['uid'];
    displayName = json['displayName'] ?? "Display Name";
    email = json['email'];
    role = json["role"];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = id;
    data['email'] = email;
    data['displayName'] = displayName;
    data['role'] = role;
    data['avatar'] = avatar;
    return data;
  }
}
