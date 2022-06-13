import 'package:hotel_booking/models/model_user.dart';

class BeatModel {
  late String key;
  late String id;
  late TypeBeat type;
  late Producer producer;
  late UserModel creator;
  late String createDate;
  late String name;
  late double price;
  late double discount;
  late String description;
  late Thumbnail thumbnail;
  late bool isSold;
  BeatModel(
      {required this.key,
      required this.id,
      required this.type,
      required this.producer,
      required this.creator,
      required this.createDate,
      required this.name,
      required this.price,
      required this.discount,
      required this.thumbnail,
      required this.description,
      required this.isSold});
  BeatModel.initial(UserModel user) {
    this.key = '-1';
    this.id = '-1';
    this.type = TypeBeat(icon: '', name: '');
    this.producer = Producer(email: '', name: '');
    this.creator = user;
    this.createDate = "";
    this.name = "";
    this.price = 0;
    this.discount = 0;
    this.thumbnail = Thumbnail(image: '', audio: '');
    this.description = "";
    this.isSold = false;
  }
  BeatModel.fromJson(json, key) {
    this.key = key;
    id = json['id'].toString();
    type = TypeBeat.fromJson(json['type']);
    creator = UserModel.fromJson(json['creator']);
    producer = Producer.fromJson(json['producer']);
    createDate = json['createDate'];
    name = json['name'] ?? '';
    price = double.parse(json['price'].toString());
    discount = double.parse(json['discount'].toString());
    description = json['description'] ?? '';
    thumbnail = Thumbnail.fromJson(json['thumbnail']);
    isSold = json['isSold'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['type'] = this.type.toJson();
    data['producer'] = this.producer.toJson();
    data['createDate'] = this.createDate;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['thumbnail'] = this.thumbnail.toJson();
    data['description'] = this.description;
    data['creator'] = this.creator.toJson();
    data['isSold'] = this.isSold;
    return data;
  }
}

class Thumbnail {
  late String image;
  late String audio;

  Thumbnail({required this.image, required this.audio});

  Thumbnail.fromJson(json) {
    image = json['image'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['audio'] = this.audio;
    return data;
  }
}

class TypeBeat {
  late String name;
  late String icon;

  TypeBeat({required this.name, required this.icon});

  TypeBeat.fromJson(json) {
    name = json['name'] ?? '';
    icon = json['icon'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}

class Producer {
  late String name;
  late String email;

  Producer({required this.name, required this.email});

  Producer.fromJson(json) {
    name = json['name'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
