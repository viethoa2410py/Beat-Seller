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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['value'] = value;
    data['expirationDate'] = expirationDate;
    return data;
  }
}
