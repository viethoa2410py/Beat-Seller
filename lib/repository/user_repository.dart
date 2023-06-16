import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:beatSeller/api/api.dart';
import 'package:beatSeller/models/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static UserModel? currentUser;

  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() {
    return _instance;
  }

  UserRepository._internal();
  static Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    if (userId != null && userId.isNotEmpty) {
      var result = await getUser(userId);

      currentUser = result;
    }
  }

  static Future<UserModel?> login(email, password) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (user.user != null) {
        var result = await getUser(user.user!.uid);

        currentUser = result;
        prefs.setBool('isLogin', true);
        prefs.setString('userId', currentUser!.id);
        return result;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<UserModel?> register(email, password, displayName) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (user.user != null) {
        var user0 = UserModel(
            id: user.user!.uid,
            email: user.user!.email!,
            displayName: displayName,
            role: "Customer");
        await Api.createUser(user0);
        currentUser = user0;
        prefs.setBool('isLogin', true);
        prefs.setString('userId', currentUser!.id);
        return user0;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static getUser(userId) async {
    var result = await Api.getUser(userId);
    return UserModel.fromJson(result);
  }

  static updateInfo(File? image) async {
    try {
      if (image != null) {
        var path = await Api.uploadFile(image);
        currentUser!.avatar = path;
      }
      await Api.updateUser(currentUser!);
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> sentCode(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> updatePass(
      String email, String code, String newPass) async {
    try {
      await FirebaseAuth.instance
          .confirmPasswordReset(code: code, newPassword: newPass);
    } catch (e) {
      print(e);
    }
    return false;
  }
}
