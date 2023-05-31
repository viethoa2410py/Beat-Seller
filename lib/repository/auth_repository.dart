import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {}

class FireBaseAuthRepository extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInWithEmail(
      {required String email, required String password}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      prefs.setBool('isLogin', true);
      prefs.setString('userId', user!.uid);
      return _userIdFromFirebase(user);
    } catch (e) {
      print(e);
    }
  }

  Future registerWithEmail(
      {required String email, required String password}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      prefs.setBool('isLogin', true);
      prefs.setString('userId', user!.uid);
      return _userIdFromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogin', false);
      prefs.setString('userId', '');
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String? _userIdFromFirebase(User? user) {
    if (user != null) {
      return user.uid;
    } else {
      return 'Failed';
    }
  }
}
