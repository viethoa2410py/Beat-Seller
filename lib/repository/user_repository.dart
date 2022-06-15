import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_booking/api/api.dart';
import 'package:hotel_booking/models/model_user.dart';

class UserRepository {
  static UserModel? currentUser;

  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() {
    return _instance;
  }

  UserRepository._internal();

  static Future<UserModel?> login(email, password) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (user.user != null) {
      var result = await getUser(user.user!.uid);

      currentUser = result;
      return result;
    }
    return null;
  }

  static Future<UserModel?> register(email, password, displayName) async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    if (user.user != null) {
      var _user = UserModel(
          id: user.user!.uid, email: user.user!.email!, displayName: displayName,role: "Customer");
      await Api.createUser(_user);
      currentUser = _user;
      return _user;
    }
    return null;
  }

  static getUser(userId) async {
    var result = await Api.getUser(userId);
    return UserModel.fromJson(result);
  }
}
