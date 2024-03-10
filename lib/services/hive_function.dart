import 'package:hive_flutter/hive_flutter.dart';
import 'package:shuttle_9ja/services/Hive/user_entity.dart';

class HiveFunction {
  static var userBox = Hive.box('userBox');
  static void insertUserAndToken(
      {required String token, required UserEntity userEntity}) {
    userBox.put('user', userEntity);
    userBox.put("token", token);
  }

  static void insertToken(String token) {
    userBox.put("token", token);
  }

  static String getToken() {
    return userBox.get("token");
  }

  static void deleteToken() {
    userBox.delete("token");
  }

  static bool tokenExist() {
    return userBox.get("token") != null;
  }

  static UserEntity getUser() {
    return userBox.get("user");
  }

  static void deleteUser() {
    userBox.delete("user");
  }

  static bool userExist() {
    return userBox.get("user") != null;
  }
}
