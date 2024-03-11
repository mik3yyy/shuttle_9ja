import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:user_repository/src/models/model.dart';

abstract class UserRepo {
  User get getUser;
  Future<void> deleteUser();
  Future<Map<String, dynamic>> updateUser(
      Map<String, dynamic> user, String token);
  Future<Map<String, dynamic>> signIn(
      {required String email, required String password});
  Future<Map<String, dynamic>> verifyEmail({required String pin});
  Future<Map<String, dynamic>> resendOTP(
      {required String email, required String password});
  Future<void> logout();
  Future<Map> singUp(Map<String, dynamic> user);
  Future<Map> changePassword(Map<String, dynamic> Data, String token);
  Future<Map<String, dynamic>> uploadPhoto(File file, String token);
  Future<Map<String, dynamic>> forgotPassword(
    Map<String, dynamic> Data,
  );
  Future<Map<String, dynamic>> resetPassword(
    Map<String, dynamic> Data,
  );
  // Future<Map> updateUser(Map<String, dynamic> user);
}
