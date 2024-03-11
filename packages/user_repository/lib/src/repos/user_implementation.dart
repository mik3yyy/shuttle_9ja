import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:user_repository/src/data_provider/user_provider.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/repos/user_repo.dart';

class userRepoImp implements UserRepo {
  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement getUser
  User get getUser {
    return User.fill();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> singUp(Map<String, dynamic> user) async {
    try {
      final res = await UserDataProvider.signUp(user);
      final data = jsonDecode(res);

      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> signIn(
      {required String email, required String password}) async {
    try {
      final res = await UserDataProvider.signIn(email, password);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> verifyEmail({required String pin}) async {
    try {
      final res = await UserDataProvider.verify(pin);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> resendOTP(
      {required String email, required String password}) async {
    // TODO: implement resendOTP
    try {
      final res = await UserDataProvider.resendOTP(email: email);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> updateUser(
      Map<String, dynamic> user, String token) async {
    // TODO: implement updateUser
    try {
      final res = await UserDataProvider.updateUser(user: user, token: token);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> changePassword(
      Map<String, dynamic> Data, String token) async {
    // TODO: implement changePassword
    try {
      final res =
          await UserDataProvider.changePassword(data: Data, token: token);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> uploadPhoto(File file, String token) async {
    try {
      final res = await UserDataProvider.uploadPhoto(file: file, token: token);
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(Map<String, dynamic> Data) async {
    try {
      final res = await UserDataProvider.forgotPassword(
        data: Data,
      );
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }

  @override
  Future<Map<String, dynamic>> resetPassword(Map<String, dynamic> Data) async {
    try {
      final res = await UserDataProvider.resetPassword(
        data: Data,
      );
      final data = jsonDecode(res);
      return data;
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': 'Check your network'};
    }
  }
}
