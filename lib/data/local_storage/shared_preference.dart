import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_flix/data/models/user_model.dart';

class LocalStorage {
  LocalStorage._();

  static LocalStorage instance = LocalStorage._();
  static late SharedPreferences _pref;
  static Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _pref.setString(key, value);
  }

  static String? getString(String key) {
    return _pref.getString(key);
  }

  static Future<void> setBool(String key, bool value) async {
    await _pref.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _pref.getBool(key);
  }

  static Future<void> remove(String key) async {
    await _pref.remove(key);
  }

  static Future<void> clear() async {
    await _pref.clear();
  }

  //  storeage key
  static const String userKey = 'user';

  static Future<void> saveUser(User user) async {
    final UserModel userModel = UserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
    final jsonString = jsonEncode(userModel.toJson());
    await setString(userKey, jsonString);
  }

  static UserModel? getUser() {
    final jsonString = getString(userKey);
    if (jsonString == null) return null;
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserModel.fromJson(json);
  }
}
