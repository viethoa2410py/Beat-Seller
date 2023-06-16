import 'dart:io';
import 'package:beatSeller/api/api.dart';
import 'package:beatSeller/models/model.dart';
import 'package:beatSeller/models/model_coupon.dart';

class BeatRepository {
  static final BeatRepository _instance = BeatRepository._internal();

  factory BeatRepository() {
    return _instance;
  }

  BeatRepository._internal();

  static Future<List<BeatModel>> getNewBeats(String? type) async {
    try {
      final list = <BeatModel>[];
      var data = await Api.getDataAllBeats();
      if (data != null) {
        data.forEach(
            ((key, value) => list.add(BeatModel.fromJson(value, key))));
        list.removeWhere((element) => element.isSold);
        if (type != null) {
          list.removeWhere((element) => element.type.name != type);
        }
        list.sort((a, b) => b.createDate.compareTo(a.createDate));
      }

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<BeatModel>> getRecommendedBeats() async {
    try {
      final list = <BeatModel>[];
      var data = await Api.getDataAllBeats();
      if (data != null) {
        data.forEach(
            ((key, value) => list.add(BeatModel.fromJson(value, key))));
        list.removeWhere((element) => element.isSold);
        list.sort((a, b) => b.createDate.compareTo(a.createDate));
      }

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<BeatModel?> getBeatByType(String type) async {
    final list = <BeatModel>[];
    try {
      var data = await Api.getDataAllBeats();

      if (data != null) {
        data.forEach(((key, value) {
          if (value["type"]['name'] == type) {
            list.add(BeatModel.fromJson(value, key));
          }
        }));
      }
    } catch (e) {
      print(e);
    }
    if (list.isNotEmpty) {
      return (list..shuffle()).first;
    }
    return null;
  }

  static Future<List<BeatModel>> getAllBeats() async {
    try {
      final list = <BeatModel>[];

      var data = await Api.getDataAllBeats();
      if (data != null) {
        data.forEach(
            ((key, value) => list.add(BeatModel.fromJson(value, key))));
        list.removeWhere((element) => element.isSold);
        list.sort((a, b) => b.createDate.compareTo(a.createDate));
      }

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<BeatModel>> getMyBeats(String userId) async {
    try {
      final list = <BeatModel>[];
      final listMyBeats = <BeatModel>[];
      var data = await Api.getDataAllBeats();
      if (data != null) {
        data.forEach(
            ((key, value) => list.add(BeatModel.fromJson(value, key))));
        for (var element in list) {
          if (element.creator.id == userId) {
            listMyBeats.add(element);
          }
        }
        listMyBeats.sort((a, b) => b.createDate.compareTo(a.createDate));
      }

      return listMyBeats;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<BeatModel>> getMyCart(String userId) async {
    try {
      final list = <BeatModel>[];

      var data = await Api.getDataMyCart(userId);
      if (data != null) {
        data.forEach(
            ((key, value) => list.add(BeatModel.fromJson(value, key))));
        list.removeWhere((element) => element.isSold);
        list.sort((a, b) => b.createDate.compareTo(a.createDate));
      }

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<String> uploadFile(String filePath) async {
    var file = File(filePath);
    var path = await Api.uploadFile(file);
    return path ?? '';
  }

  static Future uploadBeat(BeatModel beat) async {
    try {
      var beat0 = beat;
      beat0.thumbnail.audio = await uploadFile(beat.thumbnail.audio);
      beat0.thumbnail.image = await uploadFile(beat.thumbnail.image);
      await Api.uploadBeat(beat0);
    } catch (e) {
      print("[ERROR]: $e");
    }
  }

  static Future editBeat(BeatModel beat) async {
    try {
      await Api.editBeat(beat);
    } catch (e) {
      print("[ERROR]: $e");
    }
  }

  static Future addToCart(String userId, BeatModel beat) async {
    try {
      await Api.addToCart(userId, beat);
    } catch (e) {
      print("[ERROR]: $e");
    }
  }

  static Future<List<CouponModel>> getCoupons() async {
    try {
      final list = <CouponModel>[];

      var data = await Api.getCoupons();
      if (data != null) {
        data.forEach(((key, value) => list.add(CouponModel.fromJson(value))));

        list.sort((a, b) => a.value.compareTo(b.value));
      }

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future soldBeat(String userId, List<BeatModel> beats) async {
    try {
      for (var element in beats) {
        await Api.soldBeat(userId, element);
      }
    } catch (e) {
      print("[ERROR]: $e");
    }
  }
}
