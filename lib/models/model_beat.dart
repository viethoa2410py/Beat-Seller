import 'package:beatSeller/models/model_user.dart';

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
    key = '-1';
    id = '-1';
    type = TypeBeat(icon: '', name: '');
    producer = Producer(email: '', name: '');
    creator = user;
    createDate = "";
    name = "";
    price = 0;
    discount = 0;
    thumbnail = Thumbnail(image: '', audio: '');
    description = "";
    isSold = false;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['type'] = type.toJson();
    data['producer'] = producer.toJson();
    data['createDate'] = createDate;
    data['name'] = name;
    data['price'] = price;
    data['discount'] = discount;
    data['thumbnail'] = thumbnail.toJson();
    data['description'] = description;
    data['creator'] = creator.toJson();
    data['isSold'] = isSold;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['audio'] = audio;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
