import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../modules/login/model/login_response.dart';

class StorageUtil {
  static final _box = GetStorage();
  static const String _isLoggedIn = "isLoggedIn";
  static const String _userId = "userId";
  static const String _user = "user";

  static void write(String key, dynamic value) {
    _box.write(key, value);
  }

  static dynamic read(String key, dynamic defaultValue) {
    dynamic value = _box.read(key);

    if (value == null) {
      return defaultValue;
    } else {
      return value;
    }
  }

  static bool contains(String key) {
    return _box.hasData(key);
  }

  static void remove(String key) {
    _box.remove(key);
  }

  static void clear() {
    _box.erase();
  }

  static bool isLoggedIn() {
    return read(_isLoggedIn, false);
  }

  static void setIsLoggedIn(bool value) {
    return write(_isLoggedIn, value);
  }

  static int getUserId() {
    return read(_userId, false);
  }

  static void setUserId(int value) {
    return write(_userId, value);
  }

  static void setUser(User? value) {
    write(_user, value?.toJson());
  }

  static User? getUser() {
    late User? user;
    try {
      var json = read(_user, {});
      user = User.fromJson(json);
    } catch (e) {
      log("StorageUtil:getUser:$e");
    }
    return user;
  }
}
