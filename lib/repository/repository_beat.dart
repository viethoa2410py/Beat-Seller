import 'dart:io';
import 'package:hotel_booking/api/api.dart';
import 'package:hotel_booking/models/model.dart';
import 'package:hotel_booking/models/model_coupon.dart';

class BeatRepository {
  static final BeatRepository _instance = BeatRepository._internal();

  factory BeatRepository() {
    return _instance;
  }

  BeatRepository._internal();

  static Future<List<BeatModel>> getNewBeats() async {
    try {
      final list = <BeatModel>[];
      var data = await Api.getDataNewBeats();
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

  static Future<List<BeatModel>> getRecommendedBeats() async {
    try {
      final list = <BeatModel>[];
      final listRecommended = <BeatModel>[];
      var data = await Api.getDataRecommendedBeats();
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
      var data = await Api.getDataMyBeats();
      if (data != null) {
        data.forEach(
            ((key, value) => list.add(BeatModel.fromJson(value, key))));
        list.forEach((element) {
          if (element.creator.id == userId) {
            listMyBeats.add(element);
          }
        });
        listMyBeats.removeWhere((element) => element.isSold);
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
    print(filePath);
    var file = File(filePath);
    var path = await Api.uploadFile(file);
    return path ?? '';
  }

  static Future uploadBeat(BeatModel beat) async {
    try {
      var _beat = beat;
      _beat.thumbnail.audio = await uploadFile(beat.thumbnail.audio);
      _beat.thumbnail.image = await uploadFile(beat.thumbnail.image);
      await Api.uploadBeat(_beat);
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
