import 'dart:developer';
import 'dart:ffi';
import 'package:user_repository/src/models/model.dart';

abstract class UserRepo {
  User get getUser;
  Future<void> deleteUser();
  Future<void> updateUser(User user);
  Future<Map<String, dynamic>> signIn(
      {required String email, required String password});
  Future<Map<String, dynamic>> verifyEmail({required String pin});
  Future<Map<String, dynamic>> resendOTP(
      {required String email, required String password});
  Future<void> logout();
  Future<Map> singUp(Map<String, dynamic> user);
}
