class CouponModel {
  late int id;
  late String code;
  late String name;
  late double value;
  late String expirationDate;

  CouponModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.value,
      required this.expirationDate});

  CouponModel.fromJson(json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    value = json['value'];
    expirationDate = json['expirationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['value'] = this.value;
    data['expirationDate'] = this.expirationDate;
    return data;
  }
}
