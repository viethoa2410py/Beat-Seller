class UserModel {
  UserModel({required this.id, required this.email, required this.role});

  late String id;
  late String email;
  late String role;
  UserModel.fromJson(json) {
    id = json['uid'];
    email = json['email'];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.id;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
