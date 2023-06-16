import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:beatSeller/models/model.dart';
import 'package:beatSeller/models/model_user.dart';

class Api {
  ///Singleton factory
  static final Api _instance = Api._internal();

  factory Api() {
    return _instance;
  }

  Api._internal();
  static final FirebaseDatabase _database = FirebaseDatabase.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<dynamic> getUser(userId) async {
    try {
      final snapshot = await _database.ref('users/$userId').get();
      return snapshot.value;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> createUser(UserModel user) async {
    try {
      await _database.ref('users/${user.id}').set(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> updateUser(UserModel user) async {
    try {
      await _database.ref('users/${user.id}').update(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  static Future<String?> uploadFile(File file) async {
    try {
      final nameFile = file.path.split('/').last;
      final ref = _storage.ref().child(nameFile);
      await ref.putFile(file);
      final req = await ref.getDownloadURL();
      return req;
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  static Future<dynamic> getDataAllBeats() async {
    try {
      final snapshot = await _database.ref('beats').get();

      return snapshot.value;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> getDataMyCart(String userId) async {
    try {
      final snapshot = await _database.ref('carts/$userId').get();

      return snapshot.value;
    } catch (e) {
      print(e);
    }
  }

  static Future<void> uploadBeat(BeatModel beat) async {
    try {
      DatabaseReference newRef = _database.ref('beats').push();
      beat.id = newRef.key ?? "-1";
      await newRef.set(beat.toJson());
    } on FirebaseException catch (e) {
      print("[ERROR FIREBASE]: ${e.message}");
    } catch (e) {
      print("[ERROR]: $e");
    }
  }

  static Future<void> editBeat(BeatModel beat) async {
    try {
      DatabaseReference newRef = _database.ref('beats/${beat.key}');

      await newRef.update(beat.toJson());
    } on FirebaseException catch (e) {
      print("[ERROR FIREBASE]: ${e.message}");
    } catch (e) {
      print("[ERROR]: $e");
    }
  }

  static Future<void> addToCart(String userId, BeatModel beat) async {
    try {
      DatabaseReference newRef = _database.ref('carts/$userId').push();
      newRef.set(beat.toJson());
    } on FirebaseException catch (e) {
      print("[ERROR FIREBASE]: ${e.message}");
    } catch (e) {
      print("[ERROR]: $e");
    }
  }

  static Future<dynamic> getCoupons() async {
    try {
      final snapshot = await _database.ref('coupon').get();

      return snapshot.value;
    } catch (e) {
      print(e);
    }
  }

  static Future<void> soldBeat(String userId, BeatModel beat) async {
    try {
      DatabaseReference newRef = _database.ref('beats/${beat.id}');
      DatabaseReference newRefCart = _database.ref('carts/$userId/${beat.key}');
      newRef.update({'isSold': true});
      newRefCart.update({"isSold": true});
    } catch (e) {
      print(e);
    }
  }
}
